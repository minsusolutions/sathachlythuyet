import 'package:sathachlaixe/commons/model/exam_info/exam_info.dart';
import 'package:sathachlaixe/commons/model/liciense/liciense.dart';

abstract interface class ExamSetRepository {
  Future<Liciense> get currentLiciense;
  Future<List<ExamInfo>> getExamSetByExamCode(int examCode, int numberOfSet);
}
