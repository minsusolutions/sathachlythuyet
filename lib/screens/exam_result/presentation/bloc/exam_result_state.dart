part of 'exam_result_bloc.dart';

sealed class ExamResultState extends Equatable {
  const ExamResultState();
  
  @override
  List<Object> get props => [];
}

final class ExamResultInitial extends ExamResultState {}
