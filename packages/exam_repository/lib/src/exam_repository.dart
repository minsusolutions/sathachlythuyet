import 'package:exam_api/exam_api.dart';

class ExamRepository {
  const ExamRepository({required ExamApi examsApi}) : _examsApi = examsApi;

  final ExamApi _examsApi;

  Stream<List<Exam>> getExams() => _examsApi.getExams();

  void getExamByExamCode(int examCode) =>
      _examsApi.getAllExamsByExamCode(examCode);
}
