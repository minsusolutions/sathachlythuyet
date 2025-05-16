import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sathachlaixe/screens/home/data/repository/local_home_repository.dart';
import 'package:sathachlaixe/screens/home/domain/repository/home_repository.dart';
import 'package:sathachlaixe/screens/setting/data/repository/local_setting_repository.dart';
import 'package:sathachlaixe/screens/setting/domain/repository/setting_repository.dart';
import 'package:sathachlaixe/screens/setting/service/hive_service.dart';

Future<void> setupDependencies() async {
  final getIt = GetIt.instance;

  getIt.registerSingleton<HomeRepository>(LocalHomeRepository());

  getIt.registerSingletonAsync<SettingRepository>(() async {
    await HiveLocator.initializeHive();
    return LocalSettingRepository(
      settingBox: HiveLocator.getSettingLicienseBox(),
    );
  });

  await getIt.allReady();
}

class HiveLocator {
  static Future<void> initializeHive() async {
    await Hive.initFlutter();
    _registerAdapter();
    await Hive.openBox<dynamic>(LocalSettingRepository.settingBoxKey);
  }

  static Box<dynamic> getSettingLicienseBox() {
    return Hive.box<dynamic>(LocalSettingRepository.settingBoxKey);
  }

  static void _registerAdapter() {
    Hive.registerAdapter(SettingLicienseAdapter());
  }
}
