import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:sathachlaixe/commons/model/exam_info/exam_info.dart';
import 'package:sathachlaixe/routing/router_utils.dart';
import 'package:sathachlaixe/screens/exam/domain/model/answer_status.dart';
import 'package:sathachlaixe/screens/exam/domain/model/question.dart';
import 'package:sathachlaixe/screens/exam/domain/model/user_answer.dart';
import 'package:sathachlaixe/screens/exam/domain/repository/exam_repository.dart';

part 'exam_event.dart';
part 'exam_state.dart';

class ExamBloc extends Bloc<ExamEvent, ExamState> {
  final _logger = Logger('ExamBloc');

  ExamBloc({required ExamRepository examRepository})
    : _examRepository = examRepository,
      super(ExamInitial()) {
    on<LoadExam>(_onLoadExam);
    on<QuestionSubmitted>(_onQuestionSubbmited);
    on<AnswerSelected>(_onAnswerSelected);
    on<HintRequested>(_onHintRequested);
    on<_ExamTimerTicked>(_onExamTimerTicked);

    on<BackNavigationAttempted>(_onBackNavigationAttempted);
    on<ResetShowDialogEvent>(_onResetShowDialog);
  }

  final ExamRepository _examRepository;
  StreamSubscription<int>? _timerSubcription;

  @override
  Future<void> close() {
    _timerSubcription?.cancel();
    return super.close();
  }

  Stream<int> _tick(int ticks) {
    return Stream.periodic(const Duration(seconds: 1), (x) => ticks - x - 1).take(ticks);
  }

  Future<void> _onLoadExam(LoadExam event, Emitter<ExamState> emit) async {
    if (event.examInfoKey != null) {
      var examInfo = await _examRepository.loadExamInfoByExamInfoKey(
        event.examInfoKey!,
      );
      var listQuestions = await _examRepository.loadQuestionsFromExamInfoByIds(
        examInfo.questionIds,
      );

      Map<String, UserAnswer> userAnswers = {
        for (var q in listQuestions)
          q.buildQuestioniKeyBaseOn(
            examInfo.licienseId,
            examInfo.examCode,
            examInfo.examSetId,
          ): UserAnswer(questionId: q.qNumber),
      };

      _logger.info('userAnswers ${userAnswers} ');
      _logger.info('emit ${listQuestions.length} questions');
      emit(
        ExamLoaded(
          licienseId: examInfo.licienseId,
          examSetId: examInfo.examSetId,
          examCode: examInfo.examCode,
          listQuestion: listQuestions,
          userAnswers: userAnswers,
          duration: examInfo.duration,
          showHints: {},
          remainingDuration: examInfo.duration - 1,
        ),
      );
    } else if (event.extra != null) {
      if (event.extra == 'signs') {
        //TODO: should show exam with sign
      } else if (event.extra == 'topWrong') {
        //TODO: should show wrong
      } else if (event.extra!.contains('chapter')) {
        //TODO: should show wrong
      }
    }
  }

  Future<void> _onQuestionSubbmited(
    QuestionSubmitted event,
    Emitter<ExamState> emit,
  ) async {
    _logger.info('update status with question: ${event.index}');

    var currentState = state;
    if (currentState is ExamLoaded) {
      _logger.info('duration: ${currentState.duration}');

      if (event.index < 0 || event.index >= currentState.listQuestion.length) {
        return;
      }

      var question = currentState.listQuestion[event.index];
      var questionKey = question.buildQuestioniKeyBaseOn(
        currentState.licienseId,
        currentState.examCode,
        currentState.examSetId,
      );
      final userAnswer = currentState.userAnswers[questionKey];
      if (userAnswer?.selectedOptionValue == null) return;

      final isCorrect =
          userAnswer?.selectedOptionValue! == question.correctAnswer;
      final submittedAnswer = userAnswer?.copyWith(
        status: isCorrect ? AnswerStatus.correct : AnswerStatus.incorrect,
      );
      await _examRepository.saveUserAnswer(questionKey, submittedAnswer!);

      final updatedAnswers = Map<String, UserAnswer>.from(
        currentState.userAnswers,
      );
      updatedAnswers[questionKey] = submittedAnswer!;

      emit(currentState.copyWith(userAnswers: updatedAnswers));
    }
  }

  Future<void> _onAnswerSelected(
    AnswerSelected event,
    Emitter<ExamState> emit,
  ) async {
    _logger.info('update status with question: ${event.qNumber}');
    var currentState = state;
    if (currentState is ExamLoaded) {
      var question =
          currentState.listQuestion
              .where((q) => q.qNumber == event.qNumber)
              .first;
      var questionKey = question.buildQuestioniKeyBaseOn(
        currentState.licienseId,
        currentState.examCode,
        currentState.examSetId,
      );

      final currentAnswer = currentState.userAnswers[questionKey];
      if (currentAnswer != null &&
          currentAnswer.status == AnswerStatus.unanswered) {
        final updatedAnswers = Map<String, UserAnswer>.from(
          currentState.userAnswers,
        );

        updatedAnswers[questionKey] = UserAnswer(
          questionId: currentAnswer.questionId,
          selectedOptionValue: event.answer,
          status:
              currentState.duration > 0
                  ? currentAnswer.status
                  : (event.answer == question.correctAnswer
                      ? AnswerStatus.correct
                      : AnswerStatus.incorrect),
        );

        emit(currentState.copyWith(userAnswers: updatedAnswers));
      }
    }
  }

  Future<void> _onHintRequested(
    HintRequested event,
    Emitter<ExamState> emit,
  ) async {
    var currentState = state;
    if (currentState is ExamLoaded) {
      final updatedShownHints = Set<int>.from(currentState.showHints)
        ..add(event.qNumber);
      // Phát ra state mới với danh sách gợi ý đã được cập nhật
      emit(currentState.copyWith(showHints: updatedShownHints));
    }
  }

  void _onExamTimerTicked(_ExamTimerTicked event, Emitter<ExamState> emit) {
    var currentState = state;
    if (currentState is ExamLoaded) {
      if (event.newDuration > 0) {
        emit(currentState.copyWith(remainingDuration: event.newDuration));
      } else {
        //   final newAnswers = _autoSubmitRemainingQuestions();
        // final (correct, incorrect, unanswered) = _calculateStats(state.questions, newAnswers);

        // emit(state.copyWith(
        //   remainingDuration: 0,
        //   status: ExamStatus.timesUp, // Chuyển sang trạng thái hết giờ
        //   userAnswers: newAnswers,
        //   correctCount: correct,
        //   incorrectCount: incorrect,
        //   unansweredCount: unanswered,
        // ));
      }
    }
  }

  void _onBackNavigationAttempted(
    BackNavigationAttempted event,
    Emitter<ExamState> emit,
  ) {
    // var currentState = state;
    // if (currentState is ExamLoaded) {
    //   if (currentState.examInfo.duration > 0) {
    //     emit(currentState.copyWith(shouldShowDialog: true));
    //   } else {
    //     emit(NavigateBackToHome());
    //   }
    // }
  }

  void _onResetShowDialog(ResetShowDialogEvent event, Emitter<ExamState> emit) {
    // var currentState = state;
    // if (currentState is ExamLoaded) {
    //   emit(currentState.copyWith(shouldShowDialog: null));
    // }
  }

  //   Map<int, UserAnswer> _autoSubmitRemainingQuestions() {
  //   final newAnswers = Map<int, UserAnswer>.from(state.userAnswers);
  //   for (var question in state.questions) {
  //     final answer = newAnswers[question.id];
  //     if (answer != null && answer.status == AnswerStatus.unanswered) {
  //       // Đánh dấu câu chưa trả lời là sai
  //       final submittedAnswer = UserAnswer(
  //         questionId: question.id,
  //         selectedOptionIndex: answer.selectedOptionIndex,
  //         status: AnswerStatus.incorrect,
  //       );
  //       newAnswers[question.id] = submittedAnswer;
  //       _examRepository.saveUserAnswer(submittedAnswer);
  //     }
  //   }
  //   return newAnswers;
  // }
}


  // Future<void> _onAnswerChanged(
  //   ExamChangeAnswer event,
  //   Emitter<ExamState> emit,
  // ) async {
  //   _logger.info(event.answer);

  //   emit(state.copyWith(status: ExamStateStatus.loading));

  //   var questions = state.listQuestion;
  //   var qt = event.question.copyWith(selectedAnswer: event.answer);
  //   questions[questions.indexWhere(
  //         (element) => element.qNumber == event.question.qNumber,
  //       )] =
  //       qt;

  //   _logger.info(qt);
  //   emit(state.copyWith(listQuestion: questions));
  // }



