import 'package:hive_flutter/hive_flutter.dart';
import 'package:logging/logging.dart';
import 'package:sathachlaixe/screens/setting/domain/model/setting_liciense.dart';

class SettingLicienseHiveService {
  final _logger = Logger('SettingLicienseHiveService');
  Future<void> initializeHive() async {
    _logger.info('begin initializeHive()');

    _logger.info('await Hive.initFlutter()');
    await Hive.initFlutter();
    _logger.info('registerAdapter');

    Hive.registerAdapter(SettingLicienseAdapter());
    _logger.info('openBox');

    await Hive.openBox<SettingLiciense>('setting_liciense');
    _logger.info('initializeHive done');
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
