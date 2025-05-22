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
  Future<List<ExamInfo>> getExamSetByExamCode(int examCode, int numberOfSet) {
    try {
      List<ExamBank>? allExams = examBankBox.values.toList();
      if (allExams.isNotEmpty == true) {
        var listByExamCode = allExams.where(
          (examSet) => examSet.examCode == examCode,
        );

        List<ExamInfo> result = [];
        for (int i = 1; i <= numberOfSet; i++) {
          var listIds =
              listByExamCode
                  .where((exam) => exam.examSetID == i)
                  .map((exem) => exem.questionId)
                  .toList();

          // var setItem = ExamSet(
          //   examCode: examCode,
          //   setId: i,
          //   questionIds: listIds,
          //   numberOfFailed: 0,
          //   numberOfSucceed: 0,
          //   licienseId: 1,
          // );
          // result.add(setItem);
          //print('setItem with examSetId = $i is $setItem');
        }
        return Future.value(result);
      }
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
