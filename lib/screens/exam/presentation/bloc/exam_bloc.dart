import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sathachlaixe/screens/exam/domain/model/exam_info.dart';
import 'package:sathachlaixe/screens/exam/domain/repository/exam_repository.dart';

part 'exam_event.dart';
part 'exam_state.dart';

class ExamBloc extends Bloc<ExamEvent, ExamState> {
  ExamBloc({required ExamRepository examRepository})
    : _examRepository = examRepository,
      super(
        const ExamState(
          examInfo: ExamInfo(
            examCode: -1,
            examTitle: '',
            examType: ExamType.exam,
            questions: {},
          ),
        ),
      ) {
    on<LoadExam>(_onLoadExam);
  }

  final ExamRepository _examRepository;

  Future<void> _onLoadExam(LoadExam event, Emitter<ExamState> emit) async {
    emit(state.copyWith(examInfo: event.examInfo));
  }
}
