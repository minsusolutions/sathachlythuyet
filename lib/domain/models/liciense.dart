enum LicienseType { a1, a, b1, b, c1, c, d1, d2, d, be, c1e, ce, d1e, d2e, de }

enum VehicleType { motor, car, sideCar }

class Liciense {
  final LicienseType licienseType;
  final VehicleType vehicleType;

  Liciense({required this.licienseType, required this.vehicleType});
}
