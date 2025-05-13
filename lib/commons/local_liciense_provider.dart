// import 'package:exam_api/exam_api.dart';
// import 'package:exam_local_data/src/utils/constants.dart';
// import 'package:logging/logging.dart';
// import 'package:rxdart/subjects.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LocalLicienseProvider extends LicienseApi {
//   LocalLicienseProvider() {
//     init();
//   }
//   late final SharedPreferences _plugin;
//   final _log = Logger('LocalLicienseProvider');

//   Liciense get currLiciense => currentLiciense;

//   int? _getIntValue(String key) => _plugin.getInt(key);
//   Future<void> _setIntValue(String key, int value) =>
//       _plugin.setInt(key, value);

//   @override
//   List<Liciense> getAllLicienses() => Liciense.allLicienses();

//   @override
//   Future<void> saveCurrentLiciense(int id) async {
//     if (id != currentLiciense?.id) {
//       _log.info('new id saved: $id');
//       currentLiciense = Liciense.allLicienses().firstWhere((t) => t.id == id);
//       _currLicienseStreamController.add(currentLiciense);
//       _setIntValue(Constants.kCurrentLicienseID, id);
//     }
//   }

//   void init() async {
//     _log.info('init');
//     _plugin = await SharedPreferences.getInstance();
//     var savedLicienseId = _getIntValue(Constants.kCurrentLicienseID);
//     if (savedLicienseId == null) {
//       _log.info('savedLicienseId is null --> save the first of liciense list');
//       currentLiciense = Liciense.allLicienses().first;
//       _setIntValue(Constants.kCurrentLicienseID, currentLiciense.id);
//     } else {
//       _log.info('savedLicienseId: $savedLicienseId');
//       currentLiciense = getAllLicienses().firstWhere(
//         (t) => t.id == savedLicienseId,
//       );
//     }
//   }

//   late final _currLicienseStreamController = BehaviorSubject<Liciense>.seeded(
//     Liciense.allLicienses().first,
//   );

//   @override
//   Stream<Liciense> getCurrLiciense() {
//     return _currLicienseStreamController.asBroadcastStream();
//   }

//   @override
//   void dispose() {
//     _currLicienseStreamController.close();
//   }
// }
