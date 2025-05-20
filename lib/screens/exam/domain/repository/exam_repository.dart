import 'package:sathachlaixe/commons/model/exam.dart';
import 'package:sathachlaixe/screens/exam/domain/model/exam_info.dart';

abstract class ExamRepository {
  Stream<ExamInfo> getExam();

  Future<void> loadAllQuestionsFromCSV();

  List<ExamInfo> getAllExamsByExamCode(int examCode);

  void getExamByExamCodeAndSetCode(int examCode, int examSet);

  Future<void> close();
}
