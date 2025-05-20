import 'package:hive/hive.dart';
import 'package:sathachlaixe/screens/exam/domain/model/exam_info.dart';
import 'package:sathachlaixe/screens/exam/domain/model/question.dart';
import 'package:sathachlaixe/screens/exam/domain/repository/exam_repository.dart';

class LocalExamRepository implements ExamRepository {
  //final Box<Question> questionBox;

  // LocalExamRepository({required this.questionBox});
  LocalExamRepository();

  @override
  Future<void> loadAllQuestionsFromCSV() {
    // TODO: implement loadAllQuestionsFromCSV
    throw UnimplementedError();
  }

  @override
  List<ExamInfo> getAllExamsByExamCode(int examCode) {
    // TODO: implement getAllExamsByExamCode
    throw UnimplementedError();
  }

  @override
  Stream<ExamInfo> getExam() {
    // TODO: implement getExam
    throw UnimplementedError();
  }

  @override
  void getExamByExamCodeAndSetCode(int examCode, int examSet) {
    // TODO: implement getExamByExamCodeAndSetCode
  }

  @override
  Future<void> close() {
    // TODO: implement close
    throw UnimplementedError();
  }
}
