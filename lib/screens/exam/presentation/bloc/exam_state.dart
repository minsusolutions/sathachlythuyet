part of 'exam_bloc.dart';

sealed class ExamState extends Equatable {
  const ExamState();

  @override
  List<Object> get props => [];
}

final class ExamInitial extends ExamState {}

final class ExamLoaded extends ExamState {
  final int licienseId;
  final int examSetId;
  final int examCode;
  final List<Question> listQuestion;
  final Map<String, UserAnswer> userAnswers;
  final int duration;
  final int remainingDuration;

  final Set<int> showHints;
  final bool? shouldShowDialog;

  const ExamLoaded({
    required this.licienseId,
    required this.examSetId,
    required this.examCode,
    required this.listQuestion,
    required this.userAnswers,
    required this.duration,
    this.shouldShowDialog,
    required this.showHints,
    required this.remainingDuration,
  });

  @override
  List<Object> get props => [
    licienseId,
    examCode,
    examSetId,
    listQuestion,
    userAnswers,
    showHints,
    duration,
    remainingDuration,
  ];

  ExamLoaded copyWith({
    Map<String, UserAnswer>? userAnswers,
    Set<int>? showHints,
    int? remainingDuration,
  }) {
    return ExamLoaded(
      licienseId: licienseId,
      examSetId: examSetId,
      examCode: examCode,
      listQuestion: listQuestion,
      userAnswers: userAnswers ?? this.userAnswers,
      duration: duration,
      showHints: showHints ?? this.showHints,
      remainingDuration: remainingDuration ?? this.remainingDuration,
    );
  }
}

final class NavigateBackToHome extends ExamState {}

final class NavigateToResultScreen extends ExamState {
  final ExamInfo examInfo;

  const NavigateToResultScreen({required this.examInfo});
}
