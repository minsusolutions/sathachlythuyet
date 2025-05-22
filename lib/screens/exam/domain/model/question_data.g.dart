// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuestionDataAdapter extends TypeAdapter<QuestionData> {
  @override
  final int typeId = 5;

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
