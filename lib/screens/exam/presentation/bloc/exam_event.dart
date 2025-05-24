part of 'exam_bloc.dart';

sealed class ExamEvent {
  const ExamEvent();
}

final class LoadExam extends ExamEvent {
  const LoadExam({required this.jobCode, this.examInfo});
  final int jobCode;
  final ExamInfo? examInfo;
}

final class UpdateQuestionStatus extends ExamEvent {
  final Question question;
  const UpdateQuestionStatus({required this.question});
}