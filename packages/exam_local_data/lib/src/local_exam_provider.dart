import 'package:exam_api/exam_api.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalExamProvider extends ExamApi {
  LocalExamProvider({required SharedPreferences plugin}) : _plugin = plugin {
    _init();
  }

  final SharedPreferences _plugin;
  static const kCurrentLicienseKey = '__kCurrentLicienseKey__';
  int? _getValue(String key) => _plugin.getInt(key);

  late final _examStreamController = BehaviorSubject<List<Exam>>.seeded(
    const [],
  );

  late final List<Exam> allExams;

  _init() {
    // first read file csv
    // save to `allExams`
    //

    allExams = [
      Exam(examCode: 1, setCode: 1, questionId: 1),
      Exam(examCode: 1, setCode: 1, questionId: 10),
      Exam(examCode: 1, setCode: 2, questionId: 23),
      Exam(examCode: 1, setCode: 2, questionId: 39),
      Exam(examCode: 1, setCode: 3, questionId: 52),
      Exam(examCode: 1, setCode: 3, questionId: 74),
      Exam(examCode: 1, setCode: 4, questionId: 88),
      Exam(examCode: 1, setCode: 4, questionId: 104),
      Exam(examCode: 1, setCode: 5, questionId: 117),
      Exam(examCode: 1, setCode: 5, questionId: 140),

      Exam(examCode: 6, setCode: 1, questionId: 1),
      Exam(examCode: 6, setCode: 1, questionId: 21),
      Exam(examCode: 6, setCode: 2, questionId: 41),
      Exam(examCode: 6, setCode: 2, questionId: 61),
      Exam(examCode: 6, setCode: 3, questionId: 81),
      Exam(examCode: 6, setCode: 3, questionId: 103),
      Exam(examCode: 6, setCode: 4, questionId: 121),
      Exam(examCode: 6, setCode: 4, questionId: 141),
      Exam(examCode: 6, setCode: 5, questionId: 161),
      Exam(examCode: 6, setCode: 5, questionId: 181),
    ];
  }

  @override
  void getAllExamsByExamCode(int examCode) {
    final exams = allExams.where((t) => t.examCode == examCode).toList();
    _examStreamController.add(exams);
  }

  @override
  Stream<List<Exam>> getExams() => _examStreamController.asBroadcastStream();

  @override
  Future<void> close() {
    return _examStreamController.close();
  }
}

class ExamNotFoundExeception implements Exception {}
