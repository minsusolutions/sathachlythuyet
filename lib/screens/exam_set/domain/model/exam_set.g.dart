// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamSet _$ExamSetFromJson(Map<String, dynamic> json) => ExamSet(
      licienseId: (json['licienseId'] as num).toInt(),
      examCode: (json['examCode'] as num).toInt(),
      setId: (json['setId'] as num).toInt(),
      questionIds: (json['questionIds'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      numberOfFailed: (json['numberOfFailed'] as num).toInt(),
      numberOfSucceed: (json['numberOfSucceed'] as num).toInt(),
    );

Map<String, dynamic> _$ExamSetToJson(ExamSet instance) => <String, dynamic>{
      'licienseId': instance.licienseId,
      'examCode': instance.examCode,
      'setId': instance.setId,
      'questionIds': instance.questionIds,
      'numberOfFailed': instance.numberOfFailed,
      'numberOfSucceed': instance.numberOfSucceed,
    };
