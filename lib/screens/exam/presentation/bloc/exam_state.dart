part of 'exam_bloc.dart';

enum ExamStatus { initial, loading, success, failure }

final class ExamState extends Equatable {
  final ExamStatus status;
  final ExamInfo examInfo;

  const ExamState({this.status = ExamStatus.initial, required this.examInfo});

  ExamState copyWith({ExamStatus? status, ExamInfo? examInfo}) {
    return ExamState(
      status: status ?? this.status,
      examInfo: examInfo ?? this.examInfo,
    );
  }

  @override
  List<Object?> get props => [status, examInfo];
}
