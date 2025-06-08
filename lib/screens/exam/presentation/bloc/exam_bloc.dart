import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:sathachlaixe/commons/model/exam_info/exam_info.dart';
import 'package:sathachlaixe/routing/router_utils.dart';
import 'package:sathachlaixe/screens/exam/domain/model/question.dart';
import 'package:sathachlaixe/screens/exam/domain/model/question_data.dart';
import 'package:sathachlaixe/screens/exam/domain/repository/exam_repository.dart';

part 'exam_event.dart';
part 'exam_state.dart';

class ExamBloc extends Bloc<ExamEvent, ExamState> {
  final _logger = Logger('ExamBloc');

  ExamBloc({required ExamRepository examRepository})
    : _examRepository = examRepository,
      super(ExamInitial()) {
    on<LoadExam>(_onLoadExam);
    on<UpdateQuestionStatus>(_onUpdateSingleQuestionAnswer);
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
        examInfo.questionsData,
      );

      emit(ExamLoaded(examInfo: examInfo, listQuestion: listQuestions));
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

  Future<void> _onUpdateSingleQuestionAnswer(
    UpdateQuestionStatus event,
    Emitter<ExamState> emit,
  ) async {
    _logger.info('update status with question: ${event.question}');
    final currentState = state;
    if (currentState is ExamLoaded) {
      var correct =
          event.question.correctAnswer == event.question.selectedAnswer
              ? QuestionStatus.correct
              : QuestionStatus.incorrect;
      if (event.question.selectedAnswer > 0) {
        // emit(currentState.copyWith(status: ExamStateStatus.loading)); // occurs page rebuild
        var questionData = currentState.examInfo.questionsData;
        questionData[questionData.indexWhere(
          (element) => element.questionId == event.question.qNumber,
        )] = QuestionData(
          questionId: event.question.qNumber,
          questionStatus: correct,
        );
        var newExamInfo = currentState.examInfo.copyWith(
          questionsData: questionData,
        );

        _logger.info(questionData);
        emit(currentState.copyWith(examInfo: newExamInfo));
      }
    }
  }

  void _onBackNavigationAttempted(
    BackNavigationAttempted event,
    Emitter<ExamState> emit,
  ) {
    var currentState = state;
    if (currentState is ExamLoaded) {
      if (currentState.examInfo.duration > 0) {
        emit(currentState.copyWith(shouldShowDialog: true));
      } else {
        emit(NavigateBackToHome());
      }
    }
  }

  void _onResetShowDialog(ResetShowDialogEvent event, Emitter<ExamState> emit) {
    var currentState = state;
    if (currentState is ExamLoaded) {
      emit(currentState.copyWith(shouldShowDialog: null));
    }
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



