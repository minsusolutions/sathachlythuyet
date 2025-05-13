// import 'package:equatable/equatable.dart';
// import 'package:exam_repository/exam_repository.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'exam_event.dart';
// part 'exam_state.dart';

// class ExamBloc extends Bloc<ExamEvent, ExamState> {
//   ExamBloc({required ExamRepository examRepository})
//     : _examRepository = examRepository,
//       super(const ExamState()) {
//     on<ExamSubscriptionRequested>(_onSubscriptionRequested);
//   }

//   Future<void> _onSubscriptionRequested(
//     ExamSubscriptionRequested event,
//     Emitter<ExamState> emit,
//   ) async {}

//   final ExamRepository _examRepository;
// }
