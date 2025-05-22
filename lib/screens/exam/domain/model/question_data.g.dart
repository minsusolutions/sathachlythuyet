// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuestionDataAdapter extends TypeAdapter<QuestionData> {
  @override
  final int typeId = 11;

  @override
  QuestionData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuestionData(
      questionId: fields[0] as int,
      questionStatus: fields[1] as QuestionStatus,
    );
  }

  @override
  void write(BinaryWriter writer, QuestionData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.questionId)
      ..writeByte(1)
      ..write(obj.questionStatus);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class QuestionStatusAdapter extends TypeAdapter<QuestionStatus> {
  @override
  final int typeId = 10;

  @override
  QuestionStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return QuestionStatus.unanswer;
      case 1:
        return QuestionStatus.incorrect;
      case 2:
        return QuestionStatus.correct;
      default:
        return QuestionStatus.unanswer;
    }
  }

  @override
  void write(BinaryWriter writer, QuestionStatus obj) {
    switch (obj) {
      case QuestionStatus.unanswer:
        writer.writeByte(0);
        break;
      case QuestionStatus.incorrect:
        writer.writeByte(1);
        break;
      case QuestionStatus.correct:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
