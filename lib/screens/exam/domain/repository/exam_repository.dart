import 'package:sathachlaixe/commons/model/exam_info/exam_info.dart';
import 'package:sathachlaixe/screens/exam/domain/model/question.dart';
import 'package:sathachlaixe/screens/exam/domain/model/user_answer.dart';

abstract class ExamRepository {
  Future<List<Question>> loadQuestionsFromExamInfoByIds(List<int>? listIDs);

  Future<ExamInfo> loadExamInfoRandomlyBaseOnLicienseID();
  Future<Map<String, UserAnswer>> getUserAnswerBaseOnKeys(List<String> keys);
  Future<void> saveUserAnswer(String questionKey, UserAnswer userAnswer);

  Future<ExamInfo> loadExamInfoByExamInfoKey(String examInfoKey);
  Future<ExamInfo> loadExamInfoBaseOnChapter();
  Future<ExamInfo> loadExamInfoBaseOnLiciense();
}
