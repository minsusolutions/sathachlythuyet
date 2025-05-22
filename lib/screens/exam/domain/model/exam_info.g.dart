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

class ExamTypeAdapter extends TypeAdapter<ExamType> {
  @override
  final int typeId = 8;

  @override
  ExamType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ExamType.exam;
      case 1:
        return ExamType.revise;
      case 2:
        return ExamType.wrong;
      case 3:
        return ExamType.death;
      default:
        return ExamType.exam;
    }
  }

  @override
  void write(BinaryWriter writer, ExamType obj) {
    switch (obj) {
      case ExamType.exam:
        writer.writeByte(0);
        break;
      case ExamType.revise:
        writer.writeByte(1);
        break;
      case ExamType.wrong:
        writer.writeByte(2);
        break;
      case ExamType.death:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExamTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ExamStatusAdapter extends TypeAdapter<ExamStatus> {
  @override
  final int typeId = 9;

  @override
  ExamStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ExamStatus.initial;
      case 1:
        return ExamStatus.deadFailed;
      case 2:
        return ExamStatus.failed;
      case 3:
        return ExamStatus.passed;
      default:
        return ExamStatus.initial;
    }
  }

  @override
  void write(BinaryWriter writer, ExamStatus obj) {
    switch (obj) {
      case ExamStatus.initial:
        writer.writeByte(0);
        break;
      case ExamStatus.deadFailed:
        writer.writeByte(1);
        break;
      case ExamStatus.failed:
        writer.writeByte(2);
        break;
      case ExamStatus.passed:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExamStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
