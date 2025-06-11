import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'exam_info.g.dart';

@HiveType(typeId: 4)
class ExamInfo extends Equatable {
  static const examInfoBoxKey = '_examInfoBoxKey';

  @HiveField(0)
  final int licienseId;
  @HiveField(1)
  final int examCode;
  @HiveField(2)
  final int examSetId;
  @HiveField(3)
  final List<int> questionIds;
  @HiveField(4)
  final ExamStatus status;
  @HiveField(5)
  final int duration;
  @HiveField(6)
  final int minCorrQuestion;

  const ExamInfo({
    required this.licienseId,
    required this.examCode,
    required this.examSetId,
    required this.questionIds,
    required this.status,
    required this.duration,
    required this.minCorrQuestion,
  });

  ExamInfo copyWith({
    int? licienseId,
    int? examCode,
    int? examSetId,
    List<int>? questionIds,
    ExamStatus? status,
    String? examTitle,
    int? duration,
    int? minCorrQuestion,
  }) {
    return ExamInfo(
      licienseId: licienseId ?? this.licienseId,
      examCode: examCode ?? this.examCode,
      examSetId: examSetId ?? this.examSetId,
      questionIds: questionIds ?? this.questionIds,
      status: status ?? this.status,
      duration: duration ?? this.duration,
      minCorrQuestion: minCorrQuestion ?? this.minCorrQuestion,
    );
  }

  @override
  List<Object?> get props => [examCode, questionIds];

  @override
  String toString() {
    return 'licienseId: $licienseId, examCode: $examCode, examSetId: $examSetId, questions: $questionIds';
  }
}

@HiveType(typeId: 9)
enum ExamStatus {
  @HiveField(0)
  initial,
  @HiveField(1)
  criticalFailed,
  @HiveField(2)
  failed,
  @HiveField(3)
  passed,
}

extension ExamInfoX on ExamInfo {
  String getExamInfoKey() => ('${licienseId}__key__${examCode}__$examSetId');
}
