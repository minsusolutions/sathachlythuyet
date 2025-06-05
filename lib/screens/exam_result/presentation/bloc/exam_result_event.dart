part of 'exam_result_bloc.dart';

abstract class ExamResultEvent {}

// Sự kiện để tải thông tin bài thi
class LoadExamResultEvent extends ExamResultEvent {
  final int licenseId;
  final int examCode;
  final int? examSetId; // Có thể null nếu là bài thi ngẫu nhiên

  LoadExamResultEvent({
    required this.licenseId,
    required this.examCode,
    this.examSetId,
  });
}

// Sự kiện để lưu thông tin bài thi
class SaveExamResultEvent extends ExamResultEvent {
  final ExamInfo examInfo;

  SaveExamResultEvent(this.examInfo);
}
