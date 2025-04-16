import 'package:sathach/data/services/local_data_service.dart';
import 'package:sathach/domain/models/liciense.dart';

abstract class SettingRepository {
  List<Liciense> getLicienseList();
}

class SettingRepositoryImpl implements SettingRepository {
  SettingRepositoryImpl({required LocalDataService localDataService})
    : _localDataService = localDataService;

  final LocalDataService _localDataService;

  @override
  List<Liciense> getLicienseList() {
    return _localDataService.getLicienseList();
  }
}
