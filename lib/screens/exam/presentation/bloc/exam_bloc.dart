import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:sathachlaixe/screens/exam/domain/model/exam_info.dart';
import 'package:sathachlaixe/screens/exam/domain/model/question.dart';
import 'package:sathachlaixe/screens/exam/domain/repository/exam_repository.dart';

part 'exam_event.dart';
part 'exam_state.dart';

class ExamBloc extends Bloc<ExamEvent, ExamState> {
  final _logger = Logger('ExamBloc');

  ExamBloc({required ExamRepository examRepository})
    : _examRepository = examRepository,
      super(
        const ExamState(
          examInfo: ExamInfo(
            licienseId: -1,
            examCode: -1,
            examSetId: -1,
            questions: [],
            examTitle: '',
            status: ExamStatus.initial,
            examType: ExamType.exam,
            duration: 0,
            minCorrQuestion: 0,
          ),
          listQuestion: [],
        ),
      ) {
    on<LoadExam>(_onLoadExam);
    on<ExamChangeAnswer>(_onAnswerChanged);
  }

  final ExamRepository _examRepository;

  Future<void> _onLoadExam(LoadExam event, Emitter<ExamState> emit) async {
    var listQuestions = await _examRepository.loadQuestionsFromExamInfoByIds(
      event.examInfo.questions,
    );

    _logger.info(listQuestions);
    emit(state.copyWith(examInfo: event.examInfo, listQuestion: listQuestions));
  }

  Future<void> _onAnswerChanged(
    ExamChangeAnswer event,
    Emitter<ExamState> emit,
  ) async {
    var question = event.question;
    var answer = event.answer;
    var allQuestion = state.listQuestion;
  }
}
