import 'package:sathachlaixe/commons/model/liciense/liciense.dart';
import 'package:sathachlaixe/screens/exam_set/domain/model/exam_set.dart';

abstract interface class ExamSetRepository {
  Future<Liciense> get currentLiciense;
  Future<List<ExamSet>> getExamSetByExamCode(int examCode, int numberOfSet);
}
