// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_answer.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAnswerAdapter extends TypeAdapter<UserAnswer> {
  @override
  final int typeId = 13;

  @override
  UserAnswer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserAnswer(
      questionId: fields[0] as int,
      selectedOptionValue: fields[1] as int?,
      status: fields[2] as AnswerStatus,
    );
  }

  @override
  void write(BinaryWriter writer, UserAnswer obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.questionId)
      ..writeByte(1)
      ..write(obj.selectedOptionValue)
      ..writeByte(2)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAnswerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
