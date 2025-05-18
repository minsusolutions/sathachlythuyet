import 'package:hive/hive.dart';
import 'package:logging/logging.dart';
import 'package:sathachlaixe/commons/model/liciense/liciense.dart';
import 'package:sathachlaixe/commons/model/liciense/licienses_data.dart';
import 'package:sathachlaixe/screens/setting/domain/repository/setting_repository.dart';

class LocalSettingRepository implements SettingRepository {
  final _logger = Logger('LocalSettingRepository');
  LocalSettingRepository({required this.settingBox});

  final Box<dynamic> settingBox;

  @override
  Future<Liciense> get currentLiciense async => await settingBox.get(
    Liciense.currentLicienseKey,
    defaultValue: LiciensesData.licienses.first,
  );

  @override
  Future<List<Liciense>> get listLicienses =>
      Future.value(LiciensesData.licienses);

  @override
  Future<void> saveCurrentLiciense(Liciense current) async {
    _logger.info('saveCurrentLiciense');

    await settingBox.put(Liciense.currentLicienseKey, current);
  }

  @override
  Future<void> onClose() async {
    _logger.info('onClose');
    await settingBox.close();
  }
}
