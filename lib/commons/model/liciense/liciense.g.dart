// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liciense.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LicienseAdapter extends TypeAdapter<Liciense> {
  @override
  final int typeId = 0;

  @override
  Liciense read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Liciense(
      id: fields[0] as int,
      licienseType: fields[1] as LicienseType,
      examCode: fields[2] as int,
      image: fields[3] as String,
      noOfQuestions: fields[4] as NoOfQuestions,
      questionsPerExam: fields[6] as int,
      noOfExamSet: fields[5] as int,
      description: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Liciense obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.licienseType)
      ..writeByte(2)
      ..write(obj.examCode)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.noOfQuestions)
      ..writeByte(5)
      ..write(obj.noOfExamSet)
      ..writeByte(6)
      ..write(obj.questionsPerExam)
      ..writeByte(7)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LicienseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LicienseTypeAdapter extends TypeAdapter<LicienseType> {
  @override
  final int typeId = 5;

  @override
  LicienseType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return LicienseType.a1;
      case 1:
        return LicienseType.a;
      case 2:
        return LicienseType.b1;
      case 3:
        return LicienseType.b;
      case 4:
        return LicienseType.c1;
      case 5:
        return LicienseType.c;
      case 6:
        return LicienseType.d1;
      case 7:
        return LicienseType.d2;
      case 8:
        return LicienseType.d;
      case 9:
        return LicienseType.be;
      case 10:
        return LicienseType.c1e;
      case 11:
        return LicienseType.ce;
      case 12:
        return LicienseType.d1e;
      case 13:
        return LicienseType.d2e;
      case 14:
        return LicienseType.de;
      default:
        return LicienseType.a1;
    }
  }

  @override
  void write(BinaryWriter writer, LicienseType obj) {
    switch (obj) {
      case LicienseType.a1:
        writer.writeByte(0);
        break;
      case LicienseType.a:
        writer.writeByte(1);
        break;
      case LicienseType.b1:
        writer.writeByte(2);
        break;
      case LicienseType.b:
        writer.writeByte(3);
        break;
      case LicienseType.c1:
        writer.writeByte(4);
        break;
      case LicienseType.c:
        writer.writeByte(5);
        break;
      case LicienseType.d1:
        writer.writeByte(6);
        break;
      case LicienseType.d2:
        writer.writeByte(7);
        break;
      case LicienseType.d:
        writer.writeByte(8);
        break;
      case LicienseType.be:
        writer.writeByte(9);
        break;
      case LicienseType.c1e:
        writer.writeByte(10);
        break;
      case LicienseType.ce:
        writer.writeByte(11);
        break;
      case LicienseType.d1e:
        writer.writeByte(12);
        break;
      case LicienseType.d2e:
        writer.writeByte(13);
        break;
      case LicienseType.de:
        writer.writeByte(14);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LicienseTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VehicleTypeAdapter extends TypeAdapter<VehicleType> {
  @override
  final int typeId = 6;

  @override
  VehicleType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return VehicleType.motor;
      case 1:
        return VehicleType.tricycle;
      case 2:
        return VehicleType.sedan;
      case 3:
        return VehicleType.truck;
      case 4:
        return VehicleType.bus;
      default:
        return VehicleType.motor;
    }
  }

  @override
  void write(BinaryWriter writer, VehicleType obj) {
    switch (obj) {
      case VehicleType.motor:
        writer.writeByte(0);
        break;
      case VehicleType.tricycle:
        writer.writeByte(1);
        break;
      case VehicleType.sedan:
        writer.writeByte(2);
        break;
      case VehicleType.truck:
        writer.writeByte(3);
        break;
      case VehicleType.bus:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VehicleTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class NoOfQuestionsAdapter extends TypeAdapter<NoOfQuestions> {
  @override
  final int typeId = 7;

  @override
  NoOfQuestions read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return NoOfQuestions.q200;
      case 1:
        return NoOfQuestions.q450;
      case 2:
        return NoOfQuestions.q500;
      case 3:
        return NoOfQuestions.q600;
      default:
        return NoOfQuestions.q200;
    }
  }

  @override
  void write(BinaryWriter writer, NoOfQuestions obj) {
    switch (obj) {
      case NoOfQuestions.q200:
        writer.writeByte(0);
        break;
      case NoOfQuestions.q450:
        writer.writeByte(1);
        break;
      case NoOfQuestions.q500:
        writer.writeByte(2);
        break;
      case NoOfQuestions.q600:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoOfQuestionsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
