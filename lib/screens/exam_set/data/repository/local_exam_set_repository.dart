import 'package:hive/hive.dart';
import 'package:logging/logging.dart';
import 'package:sathachlaixe/commons/model/exam_bank/exam_bank.dart';
import 'package:sathachlaixe/commons/model/liciense/liciense.dart';
import 'package:sathachlaixe/commons/model/liciense/licienses_data.dart';
import 'package:sathachlaixe/screens/exam_set/domain/model/exam_set.dart';
import 'package:sathachlaixe/screens/exam_set/domain/repository/exam_set_repository.dart';

class LocalExamSetRepository implements ExamSetRepository {
  final Box<ExamBank> examSetBox;
  final Box<dynamic> settingBox;

  final _logger = Logger('LocalExamSetRepository');

  LocalExamSetRepository({required this.examSetBox, required this.settingBox});

  @override
  Future<List<ExamSet>> getExamSetByExamCode(int examCode, int numberOfSet) {
    try {
      List<ExamBank>? allExams = examSetBox.values.toList();
      if (allExams.isNotEmpty == true) {
        var listByExamCode = allExams.where(
          (examSet) => examSet.examCode == examCode,
        );

        for (int i = 1; i <= numberOfSet; i++) {
          var listIds =
              listByExamCode
                  .where((exam) => exam.examSetID == i)
                  .map((exem) => exem.questionId)
                  .toList();

          var setItem = ExamSet(
            examCode: examCode,
            setId: i,
            questionIds: listIds,
            numberOfFailed: 0,
            numberOfSucceed: 0,
            licienseId: 1,
          );

          print('setItem with examSetId = $i is $setItem');
        }

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
