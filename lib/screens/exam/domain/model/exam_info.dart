import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:sathachlaixe/screens/exam/domain/model/question_data.dart';

part 'exam_info.g.dart';

@HiveType(typeId: 4)
class ExamInfo extends Equatable {
  @HiveField(0)
  final int licienseId;
  @HiveField(1)
  final int examCode;
  @HiveField(2)
  final int? examSetId;
  @HiveField(3)
  final List<QuestionData> questions;
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
    required this.questions,
    required this.examTitle,
    required this.status,
    required this.examType,
    required this.duration,
    required this.minCorrQuestion,
  });

  @override
  List<Object?> get props => [examCode, examTitle, examType, questions];
}

enum ExamType { exam, revise, wrong, death }

enum ExamStatus { initial, deadFailed, failed, passed }
