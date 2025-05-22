part of 'exam_bloc.dart';

enum ExamStateStatus { initial, loading, success, failure }

final class ExamState extends Equatable {
  final ExamStateStatus status;
  final ExamInfo examInfo;
  final List<Question> listQuestion;

  const ExamState({
    this.status = ExamStateStatus.initial,
    required this.examInfo,
    required this.listQuestion,
  });

  ExamState copyWith({
    ExamStateStatus? status,
    ExamInfo? examInfo,
    List<Question>? listQuestion,
  }) {
    return ExamState(
      status: status ?? this.status,
      examInfo: examInfo ?? this.examInfo,
      listQuestion: listQuestion ?? this.listQuestion,
    );
  }

  @override
  List<Object?> get props => [status, examInfo, listQuestion];
}
