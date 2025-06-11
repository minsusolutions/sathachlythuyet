// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_status.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnswerStatusAdapter extends TypeAdapter<AnswerStatus> {
  @override
  final int typeId = 12;

  @override
  AnswerStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AnswerStatus.unanswered;
      case 1:
        return AnswerStatus.correct;
      case 2:
        return AnswerStatus.incorrect;
      default:
        return AnswerStatus.unanswered;
    }
  }

  @override
  void write(BinaryWriter writer, AnswerStatus obj) {
    switch (obj) {
      case AnswerStatus.unanswered:
        writer.writeByte(0);
        break;
      case AnswerStatus.correct:
        writer.writeByte(1);
        break;
      case AnswerStatus.incorrect:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnswerStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
