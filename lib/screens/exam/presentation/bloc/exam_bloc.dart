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
    on<BackNavigationAttempted>(_onBackNavigationAttempted);
    on<ResetShowDialogEvent>(_onResetShowDialog);
  }

  final ExamRepository _examRepository;

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



