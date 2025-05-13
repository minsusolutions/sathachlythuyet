// import 'package:csv/csv.dart';
// import 'package:exam_api/exam_api.dart';
// import 'package:flutter/services.dart';
// import 'package:logging/logging.dart';
// import 'package:rxdart/subjects.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LocalExamProvider extends ExamApi {
//   LocalExamProvider() {
//     _init();
//   }

//   late final SharedPreferences _plugin;
//   int? _getValue(String key) => _plugin.getInt(key);

//   late final _examStreamController = BehaviorSubject<Exam>();

//   late final List<Exam> allExams;
//   late final Exam currentExam;

//   final _logger = Logger('LocalExamProvider');

//   _init() async {
//     _logger.info('init');
//     _plugin = await SharedPreferences.getInstance();
//     final rawData = await rootBundle.loadString(
//       'packages/exam_local_data/assets/bank/exams.csv',
//     );

//     List<List<dynamic>> listData = CsvToListConverter(
//       eol: '\n',
//       shouldParseNumbers: true,
//       fieldDelimiter: '|',
//     ).convert(rawData);
//     allExams =
//         listData
//             .map(
//               (row) =>
//                   Exam(examCode: row[0], setCode: row[1], questionId: row[2]),
//             )
//             .toList();

//     var examByCode = allExams.where((t) => t.examCode == 6 && t.setCode == 2);

//     _logger.info(examByCode.length);
//     _logger.info(examByCode);
//   }

//   @override
//   List<Exam> getAllExamsByExamCode(int examCode) {
//     return allExams.where((t) => t.examCode == examCode).toList();
//   }

//   @override
//   Stream<Exam> getExam() => _examStreamController.asBroadcastStream();

//   @override
//   Future<void> close() {
//     return _examStreamController.close();
//   }

//   @override
//   void getExamByExamCodeAndSetCode(int examCode, int examSet) {}
// }

// class ExamNotFoundExeception implements Exception {}
