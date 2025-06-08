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

  final bool? shouldShowDialog;

  const ExamLoaded({
    required this.examInfo,
    required this.listQuestion,
    this.shouldShowDialog,
  });

  ExamLoaded copyWith({
    ExamInfo? examInfo,
    List<Question>? listQuestion,
    bool? shouldShowDialog,
  }) {
    return ExamLoaded(
      examInfo: examInfo ?? this.examInfo,
      listQuestion: listQuestion ?? this.listQuestion,
      shouldShowDialog: shouldShowDialog ?? this.shouldShowDialog,
    );
  }

  @override
  List<Object> get props => [examInfo, listQuestion];
}

final class NavigateBackToHome extends ExamState {}

final class NavigateToResultScreen extends ExamState {
  final ExamInfo examInfo;

  const NavigateToResultScreen({required this.examInfo});
}
