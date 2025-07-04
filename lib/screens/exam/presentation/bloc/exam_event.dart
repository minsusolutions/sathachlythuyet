part of 'exam_bloc.dart';

abstract class ExamEvent extends Equatable {
  const ExamEvent();
  List<Object?> get props => [];
}

final class LoadExamFromHomePage extends ExamEvent {
  const LoadExamFromHomePage({required this.page});
  final PAGE? page;
}

final class LoadExam extends ExamEvent {
  const LoadExam(this.examInfoKey, this.extra);
  final String? examInfoKey;
  final String? extra;
}

final class AnswerSelected extends ExamEvent {
  final int qNumber;
  final int answer;
  const AnswerSelected({required this.qNumber, required this.answer});
}

final class QuestionSubmitted extends ExamEvent {
  final int index;
  QuestionSubmitted({required this.index});
}

final class HintRequested extends ExamEvent {
  final int qNumber;

  HintRequested({required this.qNumber});
}

class _ExamTimerTicked extends ExamEvent {
  final int newDuration;
  const _ExamTimerTicked({required this.newDuration});
  @override
  List<Object> get props => [newDuration];
}

final class BackNavigationAttempted extends ExamEvent {}

final class UserConfirmedEndExam extends ExamEvent {}

final class UserCancelBackAction extends ExamEvent {}

final class ResetShowDialogEvent extends ExamEvent {}

final class FooEvent extends ExamEvent {}
