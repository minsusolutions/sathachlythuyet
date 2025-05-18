import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sathachlaixe/commons/model/liciense/liciense.dart';
import 'package:sathachlaixe/screens/home/data/repository/local_home_repository.dart';
import 'package:sathachlaixe/screens/home/domain/repository/home_repository.dart';
import 'package:sathachlaixe/screens/setting/setting.dart';

Future<void> setupDependencies() async {
  final getIt = GetIt.instance;

  getIt.registerSingletonAsync<SettingRepository>(() async {
    await HiveLocator.initializeHive();
    return LocalSettingRepository(
      settingBox: HiveLocator.getSettingLicienseBox(),
    );
  });

  getIt.registerSingleton<HomeRepository>(LocalHomeRepository());

  await getIt.allReady();
}

class HiveLocator {
  static Future<void> initializeHive() async {
    await Hive.initFlutter();
    _registerAdapter();
    await Hive.openBox<dynamic>(SettingLiciense.settingBoxKey);
  }

  static Box<dynamic> getSettingLicienseBox() {
    return Hive.box<dynamic>(SettingLiciense.settingBoxKey);
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

class EnumClassAdapter<T extends Enum> extends TypeAdapter<T> {
  EnumClassAdapter(this.typeId, this.values);

  @override
  final int typeId;

  final List<T> values;

  @override
  T read(BinaryReader reader) {
    final enumString = reader.read() as String;
    return values.firstWhere((e) => e.name == enumString);
  }

  @override
  void write(BinaryWriter writer, T obj) {
    writer.write(obj.name);
  }
}
