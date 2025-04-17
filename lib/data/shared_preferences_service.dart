import 'package:logging/logging.dart';
import 'package:sathach/utils/result.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  static const sampleKey = 'SAMPLE KEY';
  static const currentLicienseKey = 'CURRENT_LICIENSE';
  final _log = Logger('SharedPreferenceService');

  Future<Result<String?>> fetchSampleKey() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      _log.finer('Got token from SharedPreferences');

      return Result.ok(sharedPreferences.getString(sampleKey));
    } on Exception catch (e) {
      _log.warning('Failed to get sample key', e);
      return Result.error(e);
    }
  }

  Future<Result<void>> saveSampleKey(String? sample) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      if (sample == null) {
        _log.finer('Removed token');
        await sharedPreferences.remove(sampleKey);
      } else {
        _log.finer('Replaced token');
        await sharedPreferences.setString(sampleKey, sample);
      }
      return const Result.ok(null);
    } on Exception catch (e) {
      _log.warning('Failed to set token', e);
      return Result.error(e);
    }
  }

  Future<Result<int?>> fetchCurrentLiccense() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      _log.finer('Got currentLicienseKey from SharedPreferences');

      return Result.ok(sharedPreferences.getInt(currentLicienseKey));
    } on Exception catch (e) {
      _log.warning('Failed to get currentLicienseKey ', e);
      return Result.error(e);
    }
  }

  Future<Result<void>> saveCurrentLicense(int currentLicense) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      _log.finer('Replaced currentLiciense');
      await sharedPreferences.setInt(currentLicienseKey, currentLicense);
      return const Result.ok(null);
    } on Exception catch (e) {
      _log.warning('Failed to set currentLiciense', e);
      return Result.error(e);
    }
  }
}
