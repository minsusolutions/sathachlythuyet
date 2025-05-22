import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:logging/logging.dart';
import 'package:sathachlaixe/commons/model/exam_bank/exam_bank.dart';
import 'package:sathachlaixe/commons/model/exam_info/exam_info.dart';
import 'package:sathachlaixe/commons/model/liciense/liciense.dart';
import 'package:sathachlaixe/commons/model/liciense/licienses_data.dart';
import 'package:sathachlaixe/screens/exam/domain/model/question.dart';
import 'package:sathachlaixe/screens/exam/domain/model/question_data.dart';
import 'package:sathachlaixe/screens/home/data/home_list.dart';
import 'package:sathachlaixe/screens/home/domain/model/home_item.dart';
import 'package:sathachlaixe/screens/home/domain/repository/home_repository.dart';

class LocalHomeRepository implements HomeRepository {
  static const _examCSVLoaded = '_examCSVLoaded';
  static const _questionsCSVLoaded = '_questionsCSVLoaded';

  final _logger = Logger('LocalHomeRepository');

  final Box<dynamic> settingBox;
  final Box<ExamBank> examBankBox;
  final Box<Question> questionBox;
  final Box<ExamInfo> examInfoBox;

  LocalHomeRepository({
    required this.settingBox,
    required this.examBankBox,
    required this.questionBox,
    required this.examInfoBox,
  });

  @override
  Future<List<HomeItem>> get listHomeItems => Future.value(HomeList.homeItems);

  @override
  Future<Liciense> get currentLiciense async => await settingBox.get(
    Liciense.currentLicienseKey,
    defaultValue: LiciensesData.licienses.first,
  );

  @override
  Future<void> loadExamSetFromCsv() async {
    if (!settingBox.get(_examCSVLoaded, defaultValue: false)) {
      final rawData = await rootBundle.loadString('assets/bank/exams.csv');

      List<List<dynamic>> listData = CsvToListConverter(
        eol: '\n',
        shouldParseNumbers: true,
        fieldDelimiter: '|',
      ).convert(rawData);
      var allExams = listData.map(
        (row) =>
            ExamBank(examCode: row[0], examSetID: row[1], questionId: row[2]),
      );

      for (var exam in allExams) {
        examBankBox.add(exam);
      }
      settingBox.put(_examCSVLoaded, true);
      _logger.info('${allExams.length} exams added');
    } else {
      _logger.info('CSV Loaded');
    }
  }

  @override
  Future<void> loadQuestionsFromCsv() async {
    if (!settingBox.get(_questionsCSVLoaded, defaultValue: false)) {
      final rawData = await rootBundle.loadString('assets/bank/questions.csv');

      List<List<dynamic>> listData = CsvToListConverter(
        eol: '\n',
        shouldParseNumbers: true,
        fieldDelimiter: '|',
      ).convert(rawData);
      var allQuestions = listData.map(
        (row) => Question(
          qNumber: row[0],
          title: row[1],
          answer1: row[2],
          answer2: row[3],
          answer3: row[4],
          answer4: row[5],
          qImage: row[6],
          correctAnswer: row[7],
          qCategory: row[8],
          qNumberIn200: row[9],
          qNumberIn450: row[10],
          qNumberIn500: row[11],
          extra1: row[12],
          extra2: row[13],
          extra3: row[14],
          extra4: row[15],
          isDeadQuestion: row[16].toString() == '1' ? true : false,
          hint: row[17],
          selectedAnswer: 0,
        ),
      );

      for (var question in allQuestions) {
        questionBox.add(question);
      }
      settingBox.put(_questionsCSVLoaded, true);
      _logger.info('${allQuestions.length} questions added');
    } else {
      _logger.info('CSV Questions Loaded');
    }
  }

  @override
  Future<void> generateExamInfoByLicienseAndExamCode() async {
    List<ExamBank>? allExams = examBankBox.values.toList();

    var currLiciense = await currentLiciense;
    var listByExamCode = allExams.where(
      (examSet) => examSet.examCode == currLiciense.examCode,
    );
    for (int i = 1; i <= currLiciense.noOfExamSet; i++) {
      var examInfoKey = currLiciense.getExamInfoKey(i);
      if (examInfoBox.get(examInfoKey) != null) continue;
      var listIds =
          listByExamCode
              .where((exam) => exam.examSetID == i)
              .map((exem) => exem.questionId)
              .toList();
      var examInfo = ExamInfo(
        licienseId: currLiciense.id,
        examCode: currLiciense.examCode,
        examSetId: i,
        questions:
            listIds
                .map(
                  (ids) => QuestionData(
                    questionId: ids,
                    questionStatus: QuestionStatus.unanswer,
                  ),
                )
                .toList(),
        examTitle: 'Đề số $i',
        status: ExamStatus.initial,
        examType: ExamType.exam,
        duration: 20 * 60,
        minCorrQuestion: 20,
      );

      _logger.info(examInfo);
      examInfoBox.put(examInfoKey, examInfo);
    }
  }
}
