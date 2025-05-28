import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'exam_result_event.dart';
part 'exam_result_state.dart';

class ExamResultBloc extends Bloc<ExamResultEvent, ExamResultState> {
  ExamResultBloc() : super(ExamResultInitial()) {
    on<ExamResultEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
