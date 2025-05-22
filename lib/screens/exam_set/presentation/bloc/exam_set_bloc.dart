import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logging/logging.dart';
import 'package:sathachlaixe/commons/model/exam_info/exam_info.dart';
import 'package:sathachlaixe/screens/exam_set/domain/repository/exam_set_repository.dart';

part 'exam_set_event.dart';
part 'exam_set_state.dart';

class ExamSetBloc extends Bloc<ExamSetEvent, ExamSetState> {
  ExamSetBloc({required ExamSetRepository examSetRepository})
    : _examSetRepository = examSetRepository,
      super(ExamSetState(listExamInfo: [])) {
    on<LoadExamSetEvent>(_loadExamSet);
  }

  final ExamSetRepository _examSetRepository;
  final _logger = Logger('ExamSetBloc');

  _loadExamSet(LoadExamSetEvent event, Emitter<ExamSetState> emit) async {
    _logger.info('_loadExamSet called');
    var currentLiciense = await _examSetRepository.currentLiciense;
    var listExamInfo = await _examSetRepository.getExamSetByExamCode(
      currentLiciense.examCode,
      currentLiciense.noOfExamSet,
    );

    emit(state.copyWith(listExamInfo: listExamInfo));
  }
}
