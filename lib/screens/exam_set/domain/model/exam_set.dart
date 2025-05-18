import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exam_set.freezed.dart';

@freezed
class ExamSet with _$ExamSet {
  final int examSetID;
  final int examSetCode;
  final int examSetName;
  final int numberOfFailed;
  final int numberOFSuccedd;
  final int questionId;

  const ExamSet({
    required this.examSetID,
    required this.examSetCode,
    required this.examSetName,
    required this.numberOfFailed,
    required this.numberOFSuccedd,
    required this.questionId,
  });
}
