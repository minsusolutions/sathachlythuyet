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
    on<LoadExamFromHomePage>(_onLoadExamFromHomePage);
    on<LoadExamFromExamSetPage>(_onLoadExamFromExamSetPage);
    on<UpdateQuestionStatus>(_onUpdateSingleQuestionAnswer);
  }

  final ExamRepository _examRepository;

  Future<void> _onLoadExamFromHomePage(
    LoadExamFromHomePage event,
    Emitter<ExamState> emit,
  ) async {
    var examInfo = switch (event.page) {
      PAGE.exam => await _examRepository.loadExamInfoRandomlyBaseOnLicienseID(),
      PAGE.wrong => await _examRepository.loadExamInfoBaseOnLiciense(),
      // TODO: Handle this case.
      null => throw UnimplementedError(),
      // TODO: Handle this case.
      PAGE.home => throw UnimplementedError(),
      // TODO: Handle this case.
      PAGE.setting => throw UnimplementedError(),
      // TODO: Handle this case.
      PAGE.examSet => throw UnimplementedError(),
      // TODO: Handle this case.
      PAGE.tips => throw UnimplementedError(),
      // TODO: Handle this case.
      PAGE.dead => throw UnimplementedError(),
      // TODO: Handle this case.
      PAGE.top50 => throw UnimplementedError(),
      // TODO: Handle this case.
      PAGE.signs => throw UnimplementedError(),
      // TODO: Handle this case.
      PAGE.revise => throw UnimplementedError(),
    };
    _logger.info('examInfo: $examInfo');

    emit(
      ExamLoaded(
        examInfo: examInfo,
        listQuestion: await _examRepository.loadQuestionsFromExamInfoByIds(
          examInfo.questionsData,
        ),
      ),
    );
  }

  Future<void> _onLoadExamFromExamSetPage(
    LoadExamFromExamSetPage event,
    Emitter<ExamState> emit,
  ) async {
    var listQuestions = await _examRepository.loadQuestionsFromExamInfoByIds(
      event.examInfo.questionsData,
    );
    emit(
      ExamLoaded(
        status: ExamStateStatus.loaded,
        examInfo: event.examInfo!,
        listQuestion: listQuestions,
      ),
    );
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
        emit(
          currentState.copyWith(
            status: ExamStateStatus.loaded,
            examInfo: newExamInfo,
          ),
        );
      }
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

