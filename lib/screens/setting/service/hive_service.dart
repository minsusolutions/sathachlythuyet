import 'package:hive_flutter/hive_flutter.dart';
import 'package:sathachlaixe/screens/setting/domain/model/setting_liciense.dart';

class SettingLicienseHiveService {
  Future<void> initializeHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(SettingLicienseAdapter());
    await Hive.openBox('setting_liciense');
  }

  Box<SettingLiciense> getSettingLicienseBox() {
    return Hive.box<SettingLiciense>('setting_liciense');
  }
}

class SettingLicienseAdapter extends TypeAdapter<SettingLiciense> {
  @override
  final typeId = 0;

  @override
  SettingLiciense read(BinaryReader reader) {
    return SettingLiciense(
      title: reader.read(),
      description: reader.read(),
      image: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, SettingLiciense obj) {
    writer.write(obj.title);
    writer.write(obj.image);
    writer.write(obj.description);
  }
}
