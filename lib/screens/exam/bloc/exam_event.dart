part of 'exam_bloc.dart';

sealed class ExamEvent {
  const ExamEvent();
}

final class ExamSubscriptionRequested extends ExamEvent {
  const ExamSubscriptionRequested();
}
