import 'package:hive/hive.dart';
import 'package:logging/logging.dart';
import 'package:sathachlaixe/screens/exam/domain/model/question.dart';
import 'package:sathachlaixe/screens/exam/domain/model/question_data.dart';
import 'package:sathachlaixe/screens/exam/domain/repository/exam_repository.dart';

class LocalExamRepository implements ExamRepository {
  final Box<Question> questionBox;

  LocalExamRepository({required this.questionBox});

  final _logger = Logger('LocalExamRepository');

  @override
  Future<List<Question>> loadQuestionsFromExamInfoByIds(
    List<QuestionData> listData,
  ) async {
    _logger.info('data: ${listData.length}');
    List<Question> allQuestions = questionBox.values.toList();
    try {
      _logger.info('questions count: ${allQuestions.length}');
      var listQuestions =
          allQuestions
              .where(
                (question) =>
                    listData.any((data) => data.questionId == question.qNumber),
              )
              .toList();

      _logger.info('List Questions: $listQuestions');

      return Future.value(listQuestions);
    } on Exception {
      print('co loi');
      return Future.value([]);
    }
  }
}
