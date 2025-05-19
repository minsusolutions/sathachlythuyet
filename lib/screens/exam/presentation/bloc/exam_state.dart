part of 'exam_bloc.dart';

enum ExamStatus { initial, loading, success, failure }

final class ExamState extends Equatable {
  const ExamState({this.status = ExamStatus.initial});

  // final List<Exam>? exams;
  final ExamStatus status;

  @override
  List<Object?> get props => [status];
}
