// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExamInfoAdapter extends TypeAdapter<ExamInfo> {
  @override
  final int typeId = 4;

  @override
  ExamInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExamInfo(
      licienseId: fields[0] as int,
      examCode: fields[1] as int,
      examSetId: fields[2] as int?,
      questions: (fields[3] as List).cast<QuestionData>(),
      examTitle: fields[4] as String,
      status: fields[5] as ExamStatus,
      examType: fields[6] as ExamType,
      duration: fields[7] as int,
      minCorrQuestion: fields[8] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ExamInfo obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.licienseId)
      ..writeByte(1)
      ..write(obj.examCode)
      ..writeByte(2)
      ..write(obj.examSetId)
      ..writeByte(3)
      ..write(obj.questions)
      ..writeByte(4)
      ..write(obj.examTitle)
      ..writeByte(5)
      ..write(obj.status)
      ..writeByte(6)
      ..write(obj.examType)
      ..writeByte(7)
      ..write(obj.duration)
      ..writeByte(8)
      ..write(obj.minCorrQuestion);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExamInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
