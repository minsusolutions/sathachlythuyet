import 'package:exam_api/exam_api.dart';

class LicienseRepository {
  const LicienseRepository({required LicienseApi licienseApi})
    : _licienseApi = licienseApi;
  final LicienseApi _licienseApi;

  List<Liciense> getLicienses() => _licienseApi.getAllLicienses();

  Stream<Liciense> getCurrLiciense() => _licienseApi.getCurrLiciense();
  Future<void> saveCurrentLiciense(int id) =>
      _licienseApi.saveCurrentLiciense(id);
}
8