import 'package:sathachlaixe/commons/model/exam.dart';

abstract class ExamRepository {
  Stream<Exam> getExam();

  List<Exam> getAllExamsByExamCode(int examCode);

  void getExamByExamCodeAndSetCode(int examCode, int examSet);

  Future<void> close();
}
