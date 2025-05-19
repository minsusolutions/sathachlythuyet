part of 'exam_set_bloc.dart';

sealed class ExamSetEvent extends Equatable {
  const ExamSetEvent();

  @override
  List<Object> get props => [];
}

final class LoadExamSetEvent extends ExamSetEvent {}

final class SelectExamSetEvent extends ExamSetEvent {
  final int examSetCode;
  const SelectExamSetEvent({required this.examSetCode});
}
