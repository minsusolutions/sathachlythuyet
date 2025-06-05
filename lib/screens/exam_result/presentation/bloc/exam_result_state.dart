part of 'exam_result_bloc.dart';

abstract class ExamResultState {}

class ExamResultLoading extends ExamResultState {}

class ExamResultLoaded extends ExamResultState {
  final ExamInfo examInfo;

  ExamResultLoaded(this.examInfo);
}

class ExamResultError extends ExamResultState {
  final String message;

  ExamResultError(this.message);
}