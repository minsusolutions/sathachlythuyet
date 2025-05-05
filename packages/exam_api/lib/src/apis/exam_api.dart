import 'package:exam_api/src/models/models.dart';

abstract class ExamApi {
  Stream<List<Exam>> getExams();

  void getAllExamsByExamCode(int examCode);

  Future<void> close();
}
