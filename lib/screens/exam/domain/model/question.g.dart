// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuestionAdapter extends TypeAdapter<Question> {
  @override
  final int typeId = 3;

  @override
  Question read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Question(
      qNumber: fields[0] as int,
      title: fields[1] as String,
      answer1: fields[2] as String,
      answer2: fields[3] as String,
      answer3: fields[4] as String,
      answer4: fields[5] as String,
      qImage: fields[6] as String,
      correctAnswer: fields[7] as int,
      qCategory: fields[8] as int,
      qNumberIn200: fields[9] as int,
      qNumberIn450: fields[10] as int,
      qNumberIn500: fields[11] as int,
      extra1: fields[12] as int,
      extra2: fields[13] as int,
      extra3: fields[14] as int,
      extra4: fields[15] as int,
      isDeadQuestion: fields[16] as bool,
      hint: fields[17] as String,
      selectedAnswer: fields[18] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Question obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.qNumber)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.answer1)
      ..writeByte(3)
      ..write(obj.answer2)
      ..writeByte(4)
      ..write(obj.answer3)
      ..writeByte(5)
      ..write(obj.answer4)
      ..writeByte(6)
      ..write(obj.qImage)
      ..writeByte(7)
      ..write(obj.correctAnswer)
      ..writeByte(8)
      ..write(obj.qCategory)
      ..writeByte(9)
      ..write(obj.qNumberIn200)
      ..writeByte(10)
      ..write(obj.qNumberIn450)
      ..writeByte(11)
      ..write(obj.qNumberIn500)
      ..writeByte(12)
      ..write(obj.extra1)
      ..writeByte(13)
      ..write(obj.extra2)
      ..writeByte(14)
      ..write(obj.extra3)
      ..writeByte(15)
      ..write(obj.extra4)
      ..writeByte(16)
      ..write(obj.isDeadQuestion)
      ..writeByte(17)
      ..write(obj.hint)
      ..writeByte(18)
      ..write(obj.selectedAnswer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
