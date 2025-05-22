import 'package:sathachlaixe/commons/model/exam.dart';
import 'package:sathachlaixe/screens/exam/domain/model/exam_info.dart';
import 'package:sathachlaixe/screens/exam/domain/model/question.dart';
import 'package:sathachlaixe/screens/exam/domain/model/question_data.dart';

abstract class ExamRepository {
  Future<List<Question>> loadQuestionsFromExamInfoByIds(
    List<QuestionData> listData,
  );
}
