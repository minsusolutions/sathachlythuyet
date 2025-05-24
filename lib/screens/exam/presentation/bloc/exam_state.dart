part of 'exam_bloc.dart';

enum ExamStateStatus { initial, loading, loaded }

sealed class ExamState extends Equatable {
  const ExamState();

  @override
  List<Object> get props => [];
}

final class ExamInitial extends ExamState {}

final class ExamLoaded extends ExamState {
  final ExamStateStatus status;
  final ExamInfo examInfo;
  final List<Question> listQuestion;

  const ExamLoaded({
    this.status = ExamStateStatus.initial,
    required this.examInfo,
    required this.listQuestion,
  });

  ExamLoaded copyWith({
    ExamStateStatus? status,
    ExamInfo? examInfo,
    List<Question>? listQuestion,
  }) {
    return ExamLoaded(
      status: status ?? this.status,
      examInfo: examInfo ?? this.examInfo,
      listQuestion: listQuestion ?? this.listQuestion,
    );
  }

  @override
  List<Object> get props => [status, examInfo, listQuestion];
}
