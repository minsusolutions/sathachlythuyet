import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sathachlaixe/commons/model/liciense/liciense.dart';
import 'package:sathachlaixe/commons/utils/enum_adapter.dart';
import 'package:sathachlaixe/screens/exam_set/data/repository/local_exam_set_repository.dart';
import 'package:sathachlaixe/screens/exam_set/domain/repository/exam_set_repository.dart';
import 'package:sathachlaixe/screens/home/data/repository/local_home_repository.dart';
import 'package:sathachlaixe/screens/home/domain/repository/home_repository.dart';
import 'package:sathachlaixe/screens/setting/setting.dart';

Future<void> setupDependencies() async {
  final getIt = GetIt.instance;
  await HiveLocator.initializeHive();

  getIt.registerSingletonAsync<SettingRepository>(() async {
    await Hive.openBox<dynamic>(Liciense.settingBoxKey);
    return LocalSettingRepository(
      settingBox: HiveLocator.getSettingLicienseBox(),
    );
  });

  getIt.registerSingletonAsync<HomeRepository>(() async {
    await Hive.openBox<dynamic>(Liciense.settingBoxKey);
    return LocalHomeRepository(settingBox: HiveLocator.getSettingLicienseBox());
  });

  getIt.registerSingleton<ExamSetRepository>(LocalExamSetRepository());

  await getIt.allReady();
}

class HiveLocator {
  static Future<void> initializeHive() async {
    await Hive.initFlutter();
    _registerAdapter();
  }

  static Box<dynamic> getSettingLicienseBox() {
    return Hive.box<dynamic>(Liciense.settingBoxKey);
  }

  static void _registerAdapter() {
    Hive.registerAdapter(LicienseAdapter());

    Hive.registerAdapter<LicienseType>(
      EnumClassAdapter(1, LicienseType.values),
    );
    Hive.registerAdapter<NoOfQuestions>(
      EnumClassAdapter(2, NoOfQuestions.values),
    );
  }
}
