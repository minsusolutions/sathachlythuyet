import 'dart:math';

import 'package:hive/hive.dart';
import 'package:logging/logging.dart';
import 'package:sathachlaixe/commons/model/exam_info/exam_info.dart';
import 'package:sathachlaixe/commons/model/liciense/liciense.dart';
import 'package:sathachlaixe/commons/model/liciense/licienses_data.dart';
import 'package:sathachlaixe/screens/exam/domain/model/question.dart';
import 'package:sathachlaixe/screens/exam/domain/model/question_data.dart';
import 'package:sathachlaixe/screens/exam/domain/repository/exam_repository.dart';

class LocalExamRepository implements ExamRepository {
  final Box<Question> questionBox;
  final Box<dynamic> settingBox;
  final Box<ExamInfo> examInfoBox;

  LocalExamRepository({
    required this.questionBox,
    required this.examInfoBox,
    required this.settingBox,
  });

  final _logger = Logger('LocalExamRepository');

  @override
  Future<List<Question>> loadQuestionsFromExamInfoByIds(
    List<QuestionData>? listData,
  ) async {
    _logger.info('data: ${listData?.length}');
    List<Question> allQuestions = questionBox.values.toList();
    try {
      _logger.info('questions count: ${allQuestions.length}');
      var listQuestions =
          allQuestions
              .where(
                (question) =>
                    listData?.any(
                      (data) => data.questionId == question.qNumber,
                    ) ??
                    false,
              )
              .toList();
      return Future.value(listQuestions);
    } on Exception {
      print('co loi');
      return Future.value([]);
    }
  }

  @override
  Future<ExamInfo> loadExamInfoBaseOnChapter() {
    // TODO: implement loadExamInfoBaseOnChapter
    throw UnimplementedError();
  }

  @override
  Future<ExamInfo> loadExamInfoBaseOnLiciense() {
    // TODO: implement loadExamInfoBaseOnLiciense
    throw UnimplementedError();
  }

  @override
  Future<ExamInfo> loadExamInfoRandomlyBaseOnLicienseID() async {
    Liciense currentLiciense = await settingBox.get(
      Liciense.currentLicienseKey,
      defaultValue: LiciensesData.licienses.first,
    );
    var randomExamSetID = Random().nextInt(currentLiciense.noOfExamSet);
    _logger.info('ramdonExamSetID $randomExamSetID');
    var examInfo = examInfoBox.get(
      currentLiciense.getExamInfoKey(randomExamSetID),
    );
    return Future.value(examInfo?.copyWith(examTitle: 'Đề thi ngẫu nhiên số '));
  }

  @override
  Future<ExamInfo> loadExamInfoByExamInfoKey(String examInfoKey) {
    return Future.value(examInfoBox.get(examInfoKey));
  }
}
