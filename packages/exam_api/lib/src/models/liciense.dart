import 'package:equatable/equatable.dart';

enum LicienseType { a1, a, b1, b, c1, c, d1, d2, d, be, c1e, ce, d1e, d2e, de }

enum VehicleType { motor, tricycle, sedan, truck, bus }

enum NoOfQuestions { q200, q450, q500, q600 }

class Liciense extends Equatable {
  final int id;
  final LicienseType licienseType;
  final int examCode;
  final VehicleType vehicleType;
  final NoOfQuestions noOfQuestions;
  final int noOfExamSet;
  final int questionsPerExam;
  final String description;

  const Liciense({
    required this.id,
    required this.licienseType,
    required this.examCode,
    required this.vehicleType,
    required this.noOfQuestions,
    required this.questionsPerExam,
    required this.noOfExamSet,
    required this.description,
  });

  @override
  List<Object?> get props => [licienseType, examCode, vehicleType];

  static List<Liciense> allLicienses() {
    return [
      const Liciense(
        id: 1,
        licienseType: LicienseType.a1,
        examCode: 1,
        vehicleType: VehicleType.motor,
        noOfQuestions: NoOfQuestions.q200,
        questionsPerExam: 25,
        noOfExamSet: 18,
        description:
            "Lái xe mô tô hai bánh có dung tích xi-lanh đến 125cm3 hoặc có công suất động cơ điện đến 11kW.",
      ),
      const Liciense(
        id: 2,
        licienseType: LicienseType.a,
        examCode: 10,
        vehicleType: VehicleType.tricycle,
        noOfQuestions: NoOfQuestions.q450,
        questionsPerExam: 25,
        noOfExamSet: 18,
        description:
            "Lái xe mô tô hai bánh có dung tích xi-lanh trên 125cm3 hoặc có công suất động cơ điện trên 11kw và lái xe hạng A1.",
      ),
      const Liciense(
        id: 3,
        licienseType: LicienseType.b1,
        examCode: 11,
        vehicleType: VehicleType.sedan,
        noOfQuestions: NoOfQuestions.q500,
        questionsPerExam: 25,
        noOfExamSet: 20,
        description: "Lái xe mô tô ba bánh và lái xe hạng A1.",
      ),
      const Liciense(
        id: 4,
        licienseType: LicienseType.b,
        examCode: 6,
        vehicleType: VehicleType.sedan,
        noOfQuestions: NoOfQuestions.q600,
        questionsPerExam: 30,
        noOfExamSet: 20,
        description:
            "Lái xe ô tô chở người đến 8 chỗ ngồi (không kể chỗ lái xe); xe ô tô tải và chuyên dùng đến 3.500km; xe có kéo rơ moóc đến 750kg.",
      ),
      const Liciense(
        id: 5,
        licienseType: LicienseType.c1,
        examCode: 12,
        vehicleType: VehicleType.sedan,
        noOfQuestions: NoOfQuestions.q600,
        questionsPerExam: 35,
        noOfExamSet: 18,
        description:
            "Lái xe ô tô tải và chuyên dùng trên 3.500kg đến 7.500kg; xe có kéo rơ moóc đến 750kg; và lái xe hạng B.",
      ),
      const Liciense(
        id: 6,
        licienseType: LicienseType.c,
        examCode: 7,
        vehicleType: VehicleType.truck,
        noOfQuestions: NoOfQuestions.q600,
        questionsPerExam: 40,
        noOfExamSet: 15,
        description:
            "Lái xe ô tô tải và chuyên dùng trên 7.500kg; xe có kéo rơ moóc đến 750kg; và lái xe hạng B và C1.",
      ),
      const Liciense(
        id: 7,
        licienseType: LicienseType.d1,
        examCode: 8,
        vehicleType: VehicleType.truck,
        noOfQuestions: NoOfQuestions.q600,
        questionsPerExam: 45,
        noOfExamSet: 14,
        description:
            "Lái xe ô tô chở người trên 08 chỗ đến 16 chỗ (không kể chỗ lãi xe), xe kéo rơ moóc đến 750kg; và lái xe các hạng B, C1, C.",
      ),
      const Liciense(
        id: 8,
        licienseType: LicienseType.d2,
        examCode: 8,
        vehicleType: VehicleType.truck,
        noOfQuestions: NoOfQuestions.q600,
        questionsPerExam: 45,
        noOfExamSet: 14,
        description:
            "Lái xe ô tô chở người (kể cả xe buýt) trên 16 chỗ đến 29 chỗ (không kể chỗ lái xe), xe kéo rơ moóc đến 750kg; và lái xe các hạng B, C1, C, D1.",
      ),
      const Liciense(
        id: 9,
        licienseType: LicienseType.d,
        examCode: 8,
        vehicleType: VehicleType.truck,
        noOfQuestions: NoOfQuestions.q600,
        questionsPerExam: 45,
        noOfExamSet: 14,
        description:
            "Lái xe ô tô chở người (kể cả xe buýt) trên 29 chỗ (không kể chỗ lái xe); xe giường nằm; xe kéo rơ moóc đến 750kg; và lái xe các hạng B, C1, C, D1, D2.",
      ),
      const Liciense(
        id: 10,
        licienseType: LicienseType.be,
        examCode: 8,
        vehicleType: VehicleType.truck,
        noOfQuestions: NoOfQuestions.q600,
        questionsPerExam: 45,
        noOfExamSet: 14,
        description: "Lái xe hạng B kéo rơ moóc trên 750kg.",
      ),
      const Liciense(
        id: 11,
        licienseType: LicienseType.c1e,
        examCode: 8,
        vehicleType: VehicleType.truck,
        noOfQuestions: NoOfQuestions.q600,
        questionsPerExam: 45,
        noOfExamSet: 14,
        description: "Lái xe hạng C1 kéo rơ moóc trên 750kg.",
      ),
      const Liciense(
        id: 12,
        licienseType: LicienseType.ce,
        examCode: 8,
        vehicleType: VehicleType.truck,
        noOfQuestions: NoOfQuestions.q600,
        questionsPerExam: 45,
        noOfExamSet: 14,
        description:
            "Lái xe hạng C kéo rơ moóc trên 750kg, xe ô tô đầu kéo kéo sơ mi rơ moóc.",
      ),
      const Liciense(
        id: 13,
        licienseType: LicienseType.d1e,
        examCode: 8,
        vehicleType: VehicleType.truck,
        noOfQuestions: NoOfQuestions.q600,
        questionsPerExam: 45,
        noOfExamSet: 14,
        description: "Lái xe hạng D1 kéo rơ moóc trên 750kg.",
      ),
      const Liciense(
        id: 14,
        licienseType: LicienseType.d2e,
        examCode: 8,
        vehicleType: VehicleType.truck,
        noOfQuestions: NoOfQuestions.q600,
        questionsPerExam: 45,
        noOfExamSet: 14,
        description: "Lái xe hạng D2 kéo rơ moóc trên 750kg.",
      ),
      const Liciense(
        id: 15,
        licienseType: LicienseType.de,
        examCode: 8,
        vehicleType: VehicleType.truck,
        noOfQuestions: NoOfQuestions.q600,
        questionsPerExam: 45,
        noOfExamSet: 14,
        description:
            "Lái xe hạng D kéo rơ moóc trên 750kg; xe ô tô chở khách nối toa.",
      ),
    ];
  }
}
