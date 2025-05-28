import 'package:sathachlaixe/commons/model/exam_info/exam_info.dart';
import 'package:sathachlaixe/screens/exam/domain/model/question.dart';
import 'package:sathachlaixe/screens/exam/domain/model/question_data.dart';

abstract class ExamRepository {
  Future<List<Question>> loadQuestionsFromExamInfoByIds(
    List<QuestionData> listData,
  );

  Future<ExamInfo> loadExamInfoRandomlyBaseOnLicienseID();
  Future<ExamInfo> loadExamInfoBaseOnChapter();
  Future<ExamInfo> loadExamInfoBaseOnLiciense();
}
