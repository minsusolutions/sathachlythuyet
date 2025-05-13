// import 'package:csv/csv.dart';
// import 'package:exam_api/exam_api.dart';
// import 'package:flutter/services.dart';
// import 'package:logging/logging.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LocalQuestionProvider extends QuestionApi {
//   LocalQuestionProvider() {
//     _init();
//   }

//   late final List<Question> allQuestions;
//   late final SharedPreferences _plugin;
//   final _logger = Logger('LocalQuestionProvider');

//   void _init() async {
//     _logger.info('init');
//     _plugin = await SharedPreferences.getInstance();
//     final rawData = await rootBundle.loadString(
//       'packages/exam_local_data/assets/bank/questions.csv',
//     );

//     List<List<dynamic>> listData = CsvToListConverter(
//       eol: '\n',
//       shouldParseNumbers: true,
//       fieldDelimiter: '|',
//     ).convert(rawData);
//     allQuestions =
//         listData
//             .map(
//               (row) => Question(
//                 id: row[0],
//                 title: row[1],
//                 answer1: row[2],
//                 answer2: row[3],
//                 answer3: row[4],
//                 answer4: row[5],
//                 qImage: row[6],
//                 correctAnswer: row[7],
//                 category: row[8],
//                 qNumberIn200: row[9],
//                 qNumberIn450: row[10],
//                 qNumberIn500: row[11],
//                 arg1: row[12],
//                 arg2: row[13],
//                 arg3: row[14],
//                 arg4: row[15],
//                 isDeadQuestion: row[16],
//               ),
//             )
//             .toList();
//   }

//   @override
//   Question getQuestionById(int id) {
//     throw UnimplementedError();
//   }

//   @override
//   void dispose() {}
// }
