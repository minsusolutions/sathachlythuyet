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
import 'package:sathachlaixe/screens/splash/domain/splash_repository.dart';

class SplashRepositoryImpl implements SplashRepository {
  final Box<dynamic> settingBox;
  final Box<ExamBank> examBankBox;
  final Box<Question> questionBox;
  final Box<ExamInfo> examInfoBox;

  final _logger = Logger('SplashRepositoryImpl');

  SplashRepositoryImpl({
    required this.settingBox,
    required this.examBankBox,
    required this.questionBox,
    required this.examInfoBox,
  });

  // final Box<Question> questionsBox = Hive.box<Question>('questions');
  // final Box<ExamData> examDataBox = Hive.box<ExamData>('exam_data');

  @override
  bool isDataSeeded() {
    return settingBox.get('isDataSeeded', defaultValue: false);
  }

  @override
  Future<void> seedInitialData() async {
    
    // // --- Tạo dữ liệu mẫu ---

    // // --- Lưu vào Hive ---
    // // Dùng Map để thêm nhanh và có key là id
    // await questionsBox.putAll({for (var q in questions) q.question_id: q});
    // // Dùng add vì không cần key đặc biệt
    // await examDataBox.addAll(examData);

    await Future.wait([_loadExamSetFromCsv(), _loadQuestionsFromCsv()]);
    await _generateAllExamInfo();
    // --- Đặt cờ đã seed data ---
    await settingBox.put('isDataSeeded', true);
    _logger.info('Database seeded successfully!');
  }

  Future<void> _loadExamSetFromCsv() async {
    await examBankBox.clear();
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
    _logger.info('${allExams.length} exams added');
  }

  Future<void> _loadQuestionsFromCsv() async {
    await questionBox.clear();
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
    _logger.info('${allQuestions.length} questions added');
  }

  Future<void> _generateAllExamInfo() async {
    List<ExamBank>? allExams = examBankBox.values.toList();
    var allLicienses = LiciensesData.licienses;
    for (final currLiciense in allLicienses) {
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
          questionsData:
              listIds
                  .map(
                    (ids) => QuestionData(
                      questionId: ids,
                      questionStatus: QuestionStatus.unanswer,
                    ),
                  )
                  .toList(),
          status: ExamStatus.initial,
          duration: currLiciense.duration,
          minCorrQuestion: currLiciense.minPass,
        );

        _logger.info(examInfo);
        examInfoBox.put(examInfo.getExamInfoKey(), examInfo);
      }
    }
  }
}
