import 'package:sathachlaixe/screens/setting/domain/model/setting_liciense.dart';

abstract interface class SettingRepository {
  Future<List<SettingLiciense>> get listLicienses;
  Future<SettingLiciense> get currentLiciense;
}
