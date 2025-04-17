import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:sathach/domain/models/liciense.dart';

import '../../../data/repositories/setting/setting_repository.dart';

class SettingViewModel extends ChangeNotifier {
  SettingViewModel({required SettingRepository settingRepository})
    : _settingRepository = settingRepository {
    loadLicenseList();
  }

  final _log = Logger('SettingViewModel');

  final SettingRepository _settingRepository;

  List<Liciense> _licenses = [];
  List<Liciense> get licienseList => _licenses;
  late int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  loadLicenseList() async {
    _licenses = _settingRepository.getLicenseList();
    _selectedIndex = await _settingRepository.currentLicense;
    _log.finer('got selectedIndex: $_selectedIndex');
    _log.finer('got license list: ${_licenses.length}');
    notifyListeners();
  }

  saveCurrentLicense(int currentLicense) async {
    _log.finer('save selectedIndex: $currentLicense');
    _selectedIndex = currentLicense;
    await _settingRepository.saveCurrentLicense(currentLicense: currentLicense);
    notifyListeners();
  }
}
