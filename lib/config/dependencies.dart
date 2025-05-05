import 'package:exam_local_data/exam_local_data.dart';
import 'package:exam_repository/exam_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<SingleChildWidget> get providers {
  return [
    Provider(create: (context) => LocalLicienseProvider() as LicienseApi),
    Provider(
      create: (context) => LicienseRepository(licienseApi: context.read()),
    ),
    // Provider(
    //   create:
    //       (context) =>
    //           SettingRepositoryImpl(
    //                 localDataService: context.read(),
    //                 sharedPreferenceService: context.read(),
    //               )
    //               as SettingRepository,
    // ),
    // Provider(create: (context) => ExamRepositoryImpl() as ExamRepository),
    // ..._sharedProviders,
  ];
}
