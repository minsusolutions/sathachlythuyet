import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';
import 'package:sathachlaixe/routing/router.dart';
import 'package:sathachlaixe/screens/home/data/repository/local_home_repository.dart';
import 'package:sathachlaixe/screens/home/domain/repository/home_repository.dart';
import 'package:sathachlaixe/screens/setting/data/repository/local_setting_repository.dart';
import 'package:sathachlaixe/screens/setting/domain/repository/setting_repository.dart';
import 'package:sathachlaixe/screens/setting/service/hive_service.dart';

Future<void> _setupDependencies() async {
  Logger.root.level = Level.ALL;
  final _logger = Logger('_setupDependencies');
  final getIt = GetIt.instance;

  _logger.info('dkm');
  getIt.registerSingleton<HomeRepository>(LocalHomeRepository());

  getIt.registerLazySingletonAsync<SettingLicienseHiveService>(() async {
    final settingLicienseHiveSevice = SettingLicienseHiveService();
    await settingLicienseHiveSevice.initializeHive();
    return settingLicienseHiveSevice;
  });

  getIt.registerLazySingleton<SettingRepository>(
    () => LocalSettingRepository(hiveService: getIt()),
  );
  await getIt.allReady();
}

Future<void> main() async {
  await _setupDependencies();
  runApp(const SatHachLaiXeApp());
}

class SatHachLaiXeApp extends StatelessWidget {
  const SatHachLaiXeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: AppRouter.router.routeInformationParser,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      routerDelegate: AppRouter.router.routerDelegate,
      title: 'Sat hach lai xe',
      debugShowCheckedModeBanner: false,
    );
  }
}
