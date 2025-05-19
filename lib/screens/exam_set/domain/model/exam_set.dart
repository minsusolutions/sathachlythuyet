import 'package:freezed_annotation/freezed_annotation.dart';

part 'exam_set.freezed.dart';
part 'exam_set.g.dart';

@freezed
@JsonSerializable()
class ExamSet with _$ExamSet {
  @override
  final int licienseId;
  @override
  final int examCode;
  @override
  final int setId;
  @override
  final List<int> questionIds;
  @override
  final int numberOfFailed;
  @override
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
