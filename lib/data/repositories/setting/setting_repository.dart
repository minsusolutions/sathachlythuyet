import 'package:sathach/data/services/local_data_service.dart';
import 'package:sathach/data/shared_preferences_service.dart';
import 'package:sathach/domain/models/liciense.dart';

import '../../../utils/result.dart';

abstract class SettingRepository {
  List<Liciense> getLicenseList();
  Future<int> get currentLicense;

  Future<Result<void>> saveCurrentLicense({required int currentLicense});
}

class SettingRepositoryImpl implements SettingRepository {
  SettingRepositoryImpl({
    required LocalDataService localDataService,
    required SharedPreferenceService sharedPreferenceService,
  }) : _localDataService = localDataService,
       _sharedPreferenceService = sharedPreferenceService {
    _fetchCurrentLiciense();
  }

  final LocalDataService _localDataService;
  final SharedPreferenceService _sharedPreferenceService;

  int? _currentLicense;

  @override
  List<Liciense> getLicenseList() {
    return _localDataService.getLicenseList();
  }

  @override
  Future<int> get currentLicense async {
    if (_currentLicense != null) return _currentLicense!;
    await _fetchCurrentLiciense();
    return _currentLicense ?? 0;
  }

  Future<void> _fetchCurrentLiciense() async {
    final result = await _sharedPreferenceService.fetchCurrentLiccense();
    switch (result) {
      case Ok<int?>():
        _currentLicense = result.value;
      case Error<int?>():
        _currentLicense = 0;
    }
  }

  @override
  Future<Result<void>> saveCurrentLicense({required int currentLicense}) async {
    _currentLicense = currentLicense;
    return await _sharedPreferenceService.saveCurrentLicense(currentLicense);
  }
}
