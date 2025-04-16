import 'package:sathach/domain/models/liciense.dart';

import '../../../data/repositories/setting/setting_repository.dart';

class SettingViewModel {
  SettingViewModel({required SettingRepository settingRepository})
    : _settingRepository = settingRepository {
    loadLicienseList();
  }

  final SettingRepository _settingRepository;

  List<Liciense> _licienses = [];
  List<Liciense> get licienseList => _licienses;
  int _selectedIndex = 1;
  int get selectedIndex => _selectedIndex;

  loadLicienseList() {
    _licienses = _settingRepository.getLicienseList();
  }
}
