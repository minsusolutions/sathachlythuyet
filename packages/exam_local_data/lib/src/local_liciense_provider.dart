import 'dart:ui';

import 'package:exam_api/exam_api.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalLicienseProvider extends LicienseApi {
  LocalLicienseProvider() {
    init();
  }

  late final SharedPreferences _plugin;
  Liciense _currentLiciense = Liciense.allLicienses().first;
  static const kCurrentLiciense = '__kCurrentLiciense__';

  String? _getValue(String key) => _plugin.getString(key);
  Future<void> _setValue(String key, String value) =>
      _plugin.setString(key, value);

  int? _getIntValue(String key) => _plugin.getInt(key);
  Future<void> _setIntValue(String key, int value) =>
      _plugin.setInt(key, value);

  @override
  List<Liciense> getAllLicienses() => Liciense.allLicienses();

  @override
  Future<void> saveCurrentLiciense(int id) async {
    if (id != _currentLiciense.id) {
      _currentLiciense = Liciense.allLicienses().firstWhere((t) => t.id == id);
      _currLicienseStreamController.add(_currentLiciense);
      _setIntValue(kCurrentLiciense, id);
    }
  }

  void init() async {
    _plugin = await SharedPreferences.getInstance();
    var savedLicienseId = _getIntValue(kCurrentLiciense);
    if (savedLicienseId == null) {
      _currentLiciense = Liciense.allLicienses().first;
      _setIntValue(kCurrentLiciense, _currentLiciense.id);
    } else {
      _currentLiciense = getAllLicienses().firstWhere(
        (t) => t.id == savedLicienseId,
      );
    }
  }

  late final _currLicienseStreamController = BehaviorSubject<Liciense>.seeded(
    Liciense.allLicienses().first,
  );

  @override
  Stream<Liciense> getCurrLiciense() {
    return _currLicienseStreamController.asBroadcastStream();
  }

  @override
  void dispose() {
    _currLicienseStreamController.close();
  }
}
