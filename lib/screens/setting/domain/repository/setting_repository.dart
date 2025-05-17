import 'package:sathachlaixe/commons/model/liciense/liciense.dart';

abstract interface class SettingRepository {
  Future<List<Liciense>> get listLicienses;
  Future<Liciense> get currentLiciense;

  Future<void> saveCurrentLiciense(Liciense current);
}
