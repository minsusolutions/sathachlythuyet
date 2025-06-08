part of 'exam_bloc.dart';

sealed class ExamEvent {
  const ExamEvent();
}

final class LoadExamFromHomePage extends ExamEvent {
  const LoadExamFromHomePage({required this.page});
  final PAGE? page;
}

final class LoadExam extends ExamEvent {
  const LoadExam({this.data});
  final Object? data;
}

final class UpdateQuestionStatus extends ExamEvent {
  final Question question;
  const UpdateQuestionStatus({required this.question});
}

final class BackNavigationAttempted extends ExamEvent {}

final class UserConfirmedEndExam extends ExamEvent {}

final class UserCancelBackAction extends ExamEvent {}

final class ResetShowDialogEvent extends ExamEvent {}

final class FooEvent extends ExamEvent {}
