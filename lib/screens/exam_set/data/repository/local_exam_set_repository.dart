import 'package:hive/hive.dart';
import 'package:logging/logging.dart';
import 'package:sathachlaixe/commons/model/exam_bank/exam_bank.dart';
import 'package:sathachlaixe/commons/model/exam_info/exam_info.dart';
import 'package:sathachlaixe/commons/model/liciense/liciense.dart';
import 'package:sathachlaixe/commons/model/liciense/licienses_data.dart';
import 'package:sathachlaixe/screens/exam_set/domain/repository/exam_set_repository.dart';

class LocalExamSetRepository implements ExamSetRepository {
  final Box<ExamBank> examBankBox;
  final Box<dynamic> settingBox;
  final Box<ExamInfo> examInfoBox;

  final _logger = Logger('LocalExamSetRepository');

  LocalExamSetRepository({
    required this.examBankBox,
    required this.settingBox,
    required this.examInfoBox,
  });

  @override
  Future<List<ExamInfo?>> getExamSetByExamCode(
    int examCode,
    int numberOfSet,
  ) async {
    try {
      var currentLiciense =
          await settingBox.get(
                Liciense.currentLicienseKey,
                defaultValue: LiciensesData.licienses.first,
              )
              as Liciense;
      List<ExamInfo?> result = [];

      for (int i = 1; i <= currentLiciense.noOfExamSet; i++) {
        result.add(examInfoBox.get(currentLiciense.getExamInfoKey(i)));
      }

      return Future.value(result);
    } on Exception {
      print('co loi');
    }

    return Future.value([]);
  }

  @override
  Future<Liciense> get currentLiciense async => Future.value(
    settingBox.get(
      Liciense.currentLicienseKey,
      defaultValue: LiciensesData.licienses.first,
    ),
  );
}
