// part 'exam_set.g.dart';

// @JsonSerializable()
class ExamSet {
  final int licienseId;
  final int examCode;
  final int setId;
  final List<int> questionIds;
  final int numberOfFailed;
  final int numberOfSucceed;

  ExamSet({
    required this.licienseId,
    required this.examCode,
    required this.setId,
    required this.questionIds,
    required this.numberOfFailed,
    required this.numberOfSucceed,
  });
}
