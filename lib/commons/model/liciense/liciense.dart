import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'liciense.g.dart';

enum LicienseType { a1, a, b1, b, c1, c, d1, d2, d, be, c1e, ce, d1e, d2e, de }

enum VehicleType { motor, tricycle, sedan, truck, bus }

enum NoOfQuestions { q200, q450, q500, q600 }

@JsonSerializable()
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
