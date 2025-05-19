import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:logging/logging.dart';
import 'package:sathachlaixe/commons/model/exam_bank/exam_bank.dart';
import 'package:sathachlaixe/commons/model/liciense/liciense.dart';
import 'package:sathachlaixe/commons/model/liciense/licienses_data.dart';
import 'package:sathachlaixe/screens/home/data/home_list.dart';
import 'package:sathachlaixe/screens/home/domain/model/home_item.dart';
import 'package:sathachlaixe/screens/home/domain/repository/home_repository.dart';

class LocalHomeRepository implements HomeRepository {
  static const _examCSVLoaded = '_examCSVLoaded';

  final _logger = Logger('LocalHomeRepository');

  final Box<dynamic> settingBox;
  final Box<ExamBank> examSetBox;

  LocalHomeRepository({required this.settingBox, required this.examSetBox});

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
      var allExams =
          listData
              .map(
                (row) => ExamBank(
                  examCode: row[0],
                  examSetID: row[1],
                  questionId: row[2],
                ),
              )
              .toList();

      for (var exam in allExams) {
        examSetBox.add(exam);
      }
      // examSetBox.put(ExamSet.allExamSetKey, allExams);
      settingBox.put(_examCSVLoaded, true);
      _logger.info(allExams.toString());
    } else {
      _logger.info('CSV Loaded');
    }
  }
}
