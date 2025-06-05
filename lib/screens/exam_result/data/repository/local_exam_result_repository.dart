import 'package:hive/hive.dart';
import 'package:sathachlaixe/commons/model/exam_info/exam_info.dart';
import 'package:sathachlaixe/screens/exam_result/domain/repository/exam_result_repository.dart';

class LocalExamResultRepository implements ExamResultRepository {
  static const String _examInfoBoxName = 'examInfoBox'; // Tên Box Hive

  // Phương thức để đảm bảo Box đã được mở
  Future<Box<ExamInfo>> _getExamInfoBox() async {
    if (!Hive.isBoxOpen(_examInfoBoxName)) {
      return await Hive.openBox<ExamInfo>(_examInfoBoxName);
    }
    return Hive.box<ExamInfo>(_examInfoBoxName);
  }

  @override
  Future<ExamInfo?> getExamInfo(
    int licenseId,
    int examCode, {
    int? examSetId,
  }) async {
    final box = await _getExamInfoBox();
    // Tạo key duy nhất để tìm kiếm
    final String uniqueKey = _generateExamInfoKey(
      licenseId,
      examCode,
      examSetId,
    );
    return box.get(uniqueKey);
  }

  @override
  Future<void> saveExamInfo(ExamInfo examInfo) async {
    final box = await _getExamInfoBox();
    // Sử dụng key duy nhất để lưu hoặc cập nhật
    final String uniqueKey = _generateExamInfoKey(
      examInfo.licienseId,
      examInfo.examCode,
      examInfo.examSetId,
    );
    await box.put(uniqueKey, examInfo);
  }

  @override
  Future<List<ExamInfo>> getAllExamInfo() async {
    final box = await _getExamInfoBox();
    return box.values.toList();
  }

  // Hàm tiện ích để tạo key duy nhất cho ExamInfo
  String _generateExamInfoKey(int licenseId, int examCode, int? examSetId) {
    return 'exam_${licenseId}_${examCode}_${examSetId ?? 'random'}';
  }
}
