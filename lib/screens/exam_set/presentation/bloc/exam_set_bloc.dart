// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:exam_repository/exam_repository.dart';

// part 'exam_set_event.dart';
// part 'exam_set_state.dart';

// class ExamSetBloc extends Bloc<ExamSetEvent, ExamSetState> {
//   ExamSetBloc({
//     required LicienseRepository licienseRepository,
//     required ExamRepository examRepository,
//   }) : _licienseRepository = licienseRepository,
//        _examRepository = examRepository,
//        super(ExamSetInitial()) {
//     on<ExamSetStarted>(_examSetStarted);
//     on<ExamSetSelected>(_onExamSetSelected);
//   }

//   final LicienseRepository _licienseRepository;
//   final ExamRepository _examRepository;

//   _examSetStarted(ExamSetStarted event, Emitter<ExamSetState> emit) async {
//     var currentLiciense = _licienseRepository.getCurLiciense();
//     var listExam = _examRepository.getExamByExamCode(currentLiciense.examCode);

//   }

//   _onExamSetSelected(ExamSetSelected event, Emitter<ExamSetState> emit) {}
// }
