import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sathachlaixe/screens/exam_set/domain/repository/exam_set_repository.dart';

part 'exam_set_event.dart';
part 'exam_set_state.dart';

class ExamSetBloc extends Bloc<ExamSetEvent, ExamSetState> {
  ExamSetBloc({required ExamSetRepository examSetRepository})
    : _examSetRepository = examSetRepository,
      super(ExamSetStateInitial()) {
    on<LoadExamSetEvent>(_loadExamSet);
  }

  final ExamSetRepository _examSetRepository;

  _loadExamSet(LoadExamSetEvent event, Emitter<ExamSetState> emit) async {}
}
