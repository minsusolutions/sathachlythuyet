part of 'exam_bloc.dart';

sealed class ExamEvent {
  const ExamEvent();
}

final class LoadExamFromHomePage extends ExamEvent {
  const LoadExamFromHomePage({required this.page});
  final PAGE? page;
}

final class LoadExamFromExamSetPage extends ExamEvent {
  const LoadExamFromExamSetPage({required this.examInfo});
  final ExamInfo examInfo;
}

final class UpdateQuestionStatus extends ExamEvent {
  final Question question;
  const UpdateQuestionStatus({required this.question});
}

final class FooEvent extends ExamEvent {}
