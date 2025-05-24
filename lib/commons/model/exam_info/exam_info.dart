import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:sathachlaixe/screens/exam/domain/model/question_data.dart';

part 'exam_info.g.dart';

@HiveType(typeId: 4)
class ExamInfo extends Equatable {
  static const examInfoBoxKey = '_examInfoBoxKey';

  @HiveField(0)
  final int licienseId;
  @HiveField(1)
  final int examCode;
  @HiveField(2)
  final int? examSetId;
  @HiveField(3)
  final List<QuestionData> questionsData;
  @HiveField(4)
  final String examTitle;
  @HiveField(5)
  final ExamStatus status;
  @HiveField(6)
  final ExamType examType;
  @HiveField(7)
  final int duration;
  @HiveField(8)
  final int minCorrQuestion;

  const ExamInfo({
    required this.licienseId,
    required this.examCode,
    required this.examSetId,
    required this.questionsData,
    required this.examTitle,
    required this.status,
    required this.examType,
    required this.duration,
    required this.minCorrQuestion,
  });

  ExamInfo copyWith({List<QuestionData>? questionsData, ExamStatus? status}) {
    return ExamInfo(
      licienseId: licienseId,
      examCode: examCode,
      examSetId: examSetId,
      questionsData: questionsData ?? this.questionsData,
      examTitle: examTitle,
      status: status ?? this.status,
      examType: examType,
      duration: duration,
      minCorrQuestion: minCorrQuestion,
    );
  }

  @override
  List<Object?> get props => [examCode, examTitle, examType, questionsData];

  @override
  String toString() {
    return 'licienseId: $licienseId, examCode: $examCode, questions: $questionsData, examTitle: $examTitle';
  }
}

@HiveType(typeId: 8)
enum ExamType {
  @HiveField(0)
  exam,
  @HiveField(1)
  revise,
  @HiveField(2)
  wrong,
  @HiveField(3)
  death,
}

@HiveType(typeId: 9)
enum ExamStatus {
  @HiveField(0)
  initial,
  @HiveField(1)
  deadFailed,
  @HiveField(2)
  failed,
  @HiveField(3)
  passed,
}
