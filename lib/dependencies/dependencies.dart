import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sathachlaixe/commons/model/exam_bank/exam_bank.dart';
import 'package:sathachlaixe/commons/model/liciense/liciense.dart';
import 'package:sathachlaixe/screens/exam/data/repository/local_exam_repository.dart';
import 'package:sathachlaixe/screens/exam/domain/model/question.dart';
import 'package:sathachlaixe/screens/exam/domain/repository/exam_repository.dart';
import 'package:sathachlaixe/screens/exam_set/data/repository/local_exam_set_repository.dart';
import 'package:sathachlaixe/screens/exam_set/domain/repository/exam_set_repository.dart';
import 'package:sathachlaixe/screens/home/data/repository/local_home_repository.dart';
import 'package:sathachlaixe/screens/home/domain/repository/home_repository.dart';
import 'package:sathachlaixe/screens/setting/setting.dart';

Future<void> setupDependencies() async {
  final getIt = GetIt.instance;
  await HiveLocator.initializeHive();

  getIt.registerSingletonAsync<SettingRepository>(() async {
    await Hive.openBox<dynamic>(Liciense.settingBoxKey);
    return LocalSettingRepository(
      settingBox: HiveLocator.getSettingLicienseBox(),
    );
  });

  getIt.registerSingletonAsync<HomeRepository>(() async {
    await Hive.openBox<dynamic>(Liciense.settingBoxKey);
    await Hive.openBox<ExamBank>(ExamBank.examSetBoxKey);
    await Hive.openBox<Question>(Question.questionBoxKey);
    return LocalHomeRepository(
      settingBox: HiveLocator.getSettingLicienseBox(),
      examBankBox: HiveLocator.getExamBankBox(),
      questionBox: HiveLocator.getQuestionBox(),
    );
  });

  getIt.registerSingletonAsync<ExamSetRepository>(() async {
    await Hive.openBox<dynamic>(Liciense.settingBoxKey);
    await Hive.openBox<ExamBank>(ExamBank.examSetBoxKey);
    return LocalExamSetRepository(
      examBankBox: HiveLocator.getExamBankBox(),
      settingBox: HiveLocator.getSettingLicienseBox(),
    );
  });

  getIt.registerSingletonAsync<ExamRepository>(() async {
    // await Hive.openBox<dynamic>(Liciense.settingBoxKey);
    // await Hive.openBox<ExamBank>(ExamBank.examSetBoxKey);
    return LocalExamRepository();
  });
  await getIt.allReady();
}

class HiveLocator {
  static Future<void> initializeHive() async {
    await Hive.initFlutter();
    _registerAdapter();
  }

  static Box<dynamic> getSettingLicienseBox() {
    return Hive.box<dynamic>(Liciense.settingBoxKey);
  }

  static Box<ExamBank> getExamBankBox() {
    return Hive.box<ExamBank>(ExamBank.examSetBoxKey);
  }

  static Box<Question> getQuestionBox() {
    return Hive.box<Question>(Question.questionBoxKey);
  }

  static void _registerAdapter() {
    Hive.registerAdapter(LicienseAdapter());
    Hive.registerAdapter(ExamBankAdapter());
    Hive.registerAdapter(QuestionAdapter());
  }
}
