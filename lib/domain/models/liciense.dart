enum LicienseType { a1, a, b1, b, c1, c, d1, d2, d, be, c1e, ce, d1e, d2e, de }

enum VehicleType { motor, car, sideCar }

enum ExamSetCode { s200, s450, s500, s600 }

class Liciense {
  final LicienseType licienseType;
  final VehicleType vehicleType;
  final int examCode;
  final ExamSetCode examSetCode;
  Liciense({
    required this.licienseType,
    required this.vehicleType,
    required this.examCode,
    required this.examSetCode,
  });
}
