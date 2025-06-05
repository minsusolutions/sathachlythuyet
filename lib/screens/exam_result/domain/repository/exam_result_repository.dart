import 'package:sathachlaixe/commons/model/exam_info/exam_info.dart';

abstract class ExamResultRepository {
  // Trả thông tin ExamInfo theo licenseId và examCode (hoặc examSetId)
  Future<ExamInfo?> getExamInfo(int licenseId, int examCode, {int? examSetId});
  // Lưu thông tin ExamInfo
  Future<void> saveExamInfo(ExamInfo examInfo);
  // Trả về tất cả ExamInfo đã lưu
  Future<List<ExamInfo>> getAllExamInfo();
}
