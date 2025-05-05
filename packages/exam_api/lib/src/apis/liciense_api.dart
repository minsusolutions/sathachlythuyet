import 'package:exam_api/src/models/liciense.dart';

abstract class LicienseApi {
  Stream<Liciense> getCurrLiciense();
  List<Liciense> getAllLicienses();
  Future<void> saveCurrentLiciense(int id);
  void dispose();
}
