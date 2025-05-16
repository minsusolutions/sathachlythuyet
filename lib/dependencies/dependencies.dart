import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logging/logging.dart';
import 'package:sathachlaixe/screens/home/data/repository/local_home_repository.dart';
import 'package:sathachlaixe/screens/home/domain/repository/home_repository.dart';
import 'package:sathachlaixe/screens/setting/data/repository/local_setting_repository.dart';
import 'package:sathachlaixe/screens/setting/domain/repository/setting_repository.dart';
import 'package:sathachlaixe/screens/setting/service/hive_service.dart';

Future<void> setupDependencies() async {
  Logger.root.level = Level.ALL;
  final _logger = Logger('_setupDependencies');
  final getIt = GetIt.instance;

  _logger.info('dkm');
  getIt.registerSingleton<HomeRepository>(LocalHomeRepository());

  getIt.registerSingletonAsync<SettingRepository>(() async {
    final settingLicienseHiveSevice = HiveLocator();
    await settingLicienseHiveSevice.initializeHive();
    return LocalSettingRepository(
      settingBox: settingLicienseHiveSevice.getSettingLicienseBox(),
    );
  });

  await getIt.allReady();
}

class HiveLocator {
  final _logger = Logger('SettingLicienseHiveService');
  Future<void> initializeHive() async {
    _logger.info('begin initializeHive()');

    _logger.info('await Hive.initFlutter()');
    await Hive.initFlutter();
    _logger.info('registerAdapter');

    Hive.registerAdapter(SettingLicienseAdapter());
    _logger.info('openBox');

    await Hive.openBox('setting_liciense');
    _logger.info('initializeHive done');
  }

  Box<dynamic> getSettingLicienseBox() {
    return Hive.box('setting_liciense');
  }
}
