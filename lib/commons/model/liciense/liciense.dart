import 'package:hive/hive.dart';

part 'liciense.g.dart';

@HiveType(typeId: 5)
enum LicienseType {
  @HiveField(0)
  a1,
  @HiveField(1)
  a,
  @HiveField(2)
  b1,
  @HiveField(3)
  b,
  @HiveField(4)
  c1,
  @HiveField(5)
  c,
  @HiveField(6)
  d1,
  @HiveField(7)
  d2,
  @HiveField(8)
  d,
  @HiveField(9)
  be,
  @HiveField(10)
  c1e,
  @HiveField(11)
  ce,
  @HiveField(12)
  d1e,
  @HiveField(13)
  d2e,
  @HiveField(14)
  de,
}

@HiveType(typeId: 6)
enum VehicleType {
  @HiveField(0)
  motor,
  @HiveField(1)
  tricycle,
  @HiveField(2)
  sedan,
  @HiveField(3)
  truck,
  @HiveField(4)
  bus,
}

@HiveType(typeId: 7)
enum NoOfQuestions {
  @HiveField(0)
  q200,
  @HiveField(1)
  q450,
  @HiveField(2)
  q500,
  @HiveField(3)
  q600,
}

// @JsonSerializable()
@HiveType(typeId: 0)
class Liciense {
  static const settingBoxKey = '_settingBoxKey';
  static const currentLicienseKey = '_currentLicienseKey';

  @HiveField(0)
  final int id;
  @HiveField(1)
  final LicienseType licienseType;
  @HiveField(2)
  final int examCode;
  @HiveField(3)
  final String image;
  @HiveField(4)
  final NoOfQuestions noOfQuestions;
  @HiveField(5)
  final int noOfExamSet;
  @HiveField(6)
  final int questionsPerExam;
  @HiveField(7)
  final String description;

  const Liciense({
    required this.id,
    required this.licienseType,
    required this.examCode,
    required this.image,
    required this.noOfQuestions,
    required this.questionsPerExam,
    required this.noOfExamSet,
    required this.description,
  });
}

extension LicienseX on Liciense {
  String getExamInfoKey(int setCode) =>
      ('${licienseType.name}__key__${examCode}__$setCode');
}
