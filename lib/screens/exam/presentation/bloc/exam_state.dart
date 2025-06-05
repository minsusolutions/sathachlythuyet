part of 'exam_bloc.dart';

sealed class ExamState extends Equatable {
  const ExamState();

  @override
  List<Object> get props => [];
}

final class ExamInitial extends ExamState {}

final class ExamLoaded extends ExamState {
  final ExamInfo examInfo;
  final List<Question> listQuestion;

  const ExamLoaded({required this.examInfo, required this.listQuestion});

  ExamLoaded copyWith({ExamInfo? examInfo, List<Question>? listQuestion}) {
    return ExamLoaded(
      examInfo: examInfo ?? this.examInfo,
      listQuestion: listQuestion ?? this.listQuestion,
    );
  }

  @override
  List<Object> get props => [examInfo, listQuestion];
}
