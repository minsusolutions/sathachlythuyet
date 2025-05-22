part of 'exam_bloc.dart';

sealed class ExamEvent {
  const ExamEvent();
}

final class LoadExam extends ExamEvent {
  const LoadExam({required this.jobCode});
  final int jobCode;
}

final class ExamChangeAnswer extends ExamEvent {
  const ExamChangeAnswer({required this.question, required this.answer});
  final Question question;
  final int answer;
}
