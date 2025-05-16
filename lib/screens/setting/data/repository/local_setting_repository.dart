import 'package:hive/hive.dart';
import 'package:sathachlaixe/screens/setting/data/repository/licienses_data.dart';
import 'package:sathachlaixe/screens/setting/domain/model/setting_liciense.dart';
import 'package:sathachlaixe/screens/setting/domain/repository/setting_repository.dart';

class LocalSettingRepository implements SettingRepository {
  static const settingBoxKey = '_settingBoxKey';
  static const currentLicienseKey = '_currentLicienseKey';

  LocalSettingRepository({required this.settingBox});

  final Box<dynamic> settingBox;

  @override
  Future<SettingLiciense> get currentLiciense async => await settingBox.get(
    currentLicienseKey,
    defaultValue: LiciensesData.licienses.first,
  );

  @override
  Future<List<SettingLiciense>> get listLicienses =>
      Future.value(LiciensesData.licienses);

  @override
  Future<void> saveCurrentLiciense(SettingLiciense current) async {
    await settingBox.put(currentLicienseKey, current);
  }
}
