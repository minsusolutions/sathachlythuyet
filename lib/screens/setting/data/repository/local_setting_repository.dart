import 'package:hive/hive.dart';
import 'package:sathachlaixe/commons/model/liciense/liciense.dart';
import 'package:sathachlaixe/commons/model/liciense/licienses_data.dart';
import 'package:sathachlaixe/screens/setting/domain/model/setting_liciense.dart';
import 'package:sathachlaixe/screens/setting/domain/repository/setting_repository.dart';

class LocalSettingRepository implements SettingRepository {
  LocalSettingRepository({required this.settingBox});

  final Box<dynamic> settingBox;

  @override
  Future<Liciense> get currentLiciense async => await settingBox.get(
    SettingLiciense.currentLicienseKey,
    defaultValue: LiciensesData.licienses.first,
  );

  @override
  Future<List<Liciense>> get listLicienses =>
      Future.value(LiciensesData.licienses);

  @override
  Future<void> saveCurrentLiciense(Liciense current) async {
    await settingBox.put(SettingLiciense.currentLicienseKey, current);
  }
}
