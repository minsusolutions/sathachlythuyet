// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_bank.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExamBankAdapter extends TypeAdapter<ExamBank> {
  @override
  final int typeId = 1;

  @override
  ExamBank read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExamBank(
      examSetID: fields[0] as int,
      examCode: fields[1] as int,
      questionId: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ExamBank obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.examSetID)
      ..writeByte(1)
      ..write(obj.examCode)
      ..writeByte(2)
      ..write(obj.questionId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExamBankAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamBank _$ExamBankFromJson(Map<String, dynamic> json) => ExamBank(
      examSetID: (json['examSetID'] as num).toInt(),
      examCode: (json['examCode'] as num).toInt(),
      questionId: (json['questionId'] as num).toInt(),
    );

Map<String, dynamic> _$ExamBankToJson(ExamBank instance) => <String, dynamic>{
      'examSetID': instance.examSetID,
      'examCode': instance.examCode,
      'questionId': instance.questionId,
    };
