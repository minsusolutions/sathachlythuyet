// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_bank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamBank _$ExamBankFromJson(Map<String, dynamic> json) => ExamBank(
  examSetID: (json['examSetID'] as num).toInt(),
  examCode: (json['examSetCode'] as num).toInt(),
  questionId: (json['questionId'] as num).toInt(),
);

Map<String, dynamic> _$ExamBankToJson(ExamBank instance) => <String, dynamic>{
  'examSetID': instance.examSetID,
  'examSetCode': instance.examCode,
  'questionId': instance.questionId,
};
