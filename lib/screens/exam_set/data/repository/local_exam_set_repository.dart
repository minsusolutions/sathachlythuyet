import 'package:sathachlaixe/screens/exam_set/domain/model/exam_set.dart';
import 'package:sathachlaixe/screens/exam_set/domain/repository/exam_set_repository.dart';

class LocalExamSetRepository implements ExamSetRepository {
  @override
  Future<List<ExamSet>> getExamSetByExamCode(int examCode) {
    // TODO: implement getExamSetByExamCode
    throw UnimplementedError();
  }
}
