import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sathachlaixe/commons/model/exam_bank/exam_bank.dart';
import 'package:sathachlaixe/commons/model/liciense/liciense.dart';
import 'package:sathachlaixe/screens/exam/data/repository/local_exam_repository.dart';
import 'package:sathachlaixe/commons/model/exam_info/exam_info.dart';
import 'package:sathachlaixe/screens/exam/domain/model/question.dart';
import 'package:sathachlaixe/screens/exam/domain/model/question_data.dart';
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
    await Hive.openBox<ExamInfo>(ExamInfo.examInfoBoxKey);
    return LocalHomeRepository(
      settingBox: HiveLocator.getSettingLicienseBox(),
      examBankBox: HiveLocator.getExamBankBox(),
      questionBox: HiveLocator.getQuestionBox(),
      examInfoBox: HiveLocator.getExamInfoBox(),
    );
  });

  getIt.registerSingletonAsync<ExamSetRepository>(() async {
    await Hive.openBox<dynamic>(Liciense.settingBoxKey);
    await Hive.openBox<ExamBank>(ExamBank.examSetBoxKey);
    await Hive.openBox<ExamInfo>(ExamInfo.examInfoBoxKey);
    return LocalExamSetRepository(
      examBankBox: HiveLocator.getExamBankBox(),
      settingBox: HiveLocator.getSettingLicienseBox(),
      examInfoBox: HiveLocator.getExamInfoBox(),
    );
  });

  getIt.registerSingletonAsync<ExamRepository>(() async {
    // await Hive.openBox<dynamic>(Liciense.settingBoxKey);
    await Hive.openBox<Question>(Question.questionBoxKey);
    await Hive.openBox<ExamInfo>(ExamInfo.examInfoBoxKey);
    await Hive.openBox<dynamic>(Liciense.settingBoxKey);

    return LocalExamRepository(
      questionBox: HiveLocator.getQuestionBox(),
      settingBox: HiveLocator.getSettingLicienseBox(),
      examInfoBox: HiveLocator.getExamInfoBox(),
    );
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

  static Box<ExamInfo> getExamInfoBox() {
    return Hive.box<ExamInfo>(ExamInfo.examInfoBoxKey);
  }

  static void _registerAdapter() {
    Hive.registerAdapter(LicienseAdapter());
    Hive.registerAdapter(ExamBankAdapter());
    Hive.registerAdapter(QuestionAdapter());
    Hive.registerAdapter(LicienseTypeAdapter());
    Hive.registerAdapter(VehicleTypeAdapter());
    Hive.registerAdapter(NoOfQuestionsAdapter());
    Hive.registerAdapter(ExamTypeAdapter());
    Hive.registerAdapter(ExamStatusAdapter());
    Hive.registerAdapter(QuestionStatusAdapter());
    Hive.registerAdapter(ExamInfoAdapter());
    Hive.registerAdapter(QuestionDataAdapter());
  }
}
