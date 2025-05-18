import 'package:sathachlaixe/screens/exam_set/domain/model/exam_set.dart';

abstract interface class ExamSetRepository {
  Future<List<ExamSet>> getExamSetByExamCode(int examCode);
}
