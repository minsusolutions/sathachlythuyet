part of 'exam_bloc.dart';

sealed class ExamEvent {
  const ExamEvent();
}

final class LoadExam extends ExamEvent {
  const LoadExam({required this.examInfo});
  final ExamInfo examInfo;
}

final class ExamChangeAnswer extends ExamEvent {
  const ExamChangeAnswer(this.answerId);

  final int answerId;
}
