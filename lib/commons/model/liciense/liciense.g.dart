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

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Liciense _$LicienseFromJson(Map<String, dynamic> json) => Liciense(
      id: (json['id'] as num).toInt(),
      licienseType: $enumDecode(_$LicienseTypeEnumMap, json['licienseType']),
      examCode: (json['examCode'] as num).toInt(),
      image: json['image'] as String,
      noOfQuestions: $enumDecode(_$NoOfQuestionsEnumMap, json['noOfQuestions']),
      questionsPerExam: (json['questionsPerExam'] as num).toInt(),
      noOfExamSet: (json['noOfExamSet'] as num).toInt(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$LicienseToJson(Liciense instance) => <String, dynamic>{
      'id': instance.id,
      'licienseType': _$LicienseTypeEnumMap[instance.licienseType]!,
      'examCode': instance.examCode,
      'image': instance.image,
      'noOfQuestions': _$NoOfQuestionsEnumMap[instance.noOfQuestions]!,
      'noOfExamSet': instance.noOfExamSet,
      'questionsPerExam': instance.questionsPerExam,
      'description': instance.description,
    };

const _$LicienseTypeEnumMap = {
  LicienseType.a1: 'a1',
  LicienseType.a: 'a',
  LicienseType.b1: 'b1',
  LicienseType.b: 'b',
  LicienseType.c1: 'c1',
  LicienseType.c: 'c',
  LicienseType.d1: 'd1',
  LicienseType.d2: 'd2',
  LicienseType.d: 'd',
  LicienseType.be: 'be',
  LicienseType.c1e: 'c1e',
  LicienseType.ce: 'ce',
  LicienseType.d1e: 'd1e',
  LicienseType.d2e: 'd2e',
  LicienseType.de: 'de',
};

const _$NoOfQuestionsEnumMap = {
  NoOfQuestions.q200: 'q200',
  NoOfQuestions.q450: 'q450',
  NoOfQuestions.q500: 'q500',
  NoOfQuestions.q600: 'q600',
};
