import 'package:hive/hive.dart';
import 'package:sathachlaixe/commons/model/exam_bank/exam_bank.dart';
import 'package:sathachlaixe/commons/model/exam_info/exam_info.dart';
import 'package:sathachlaixe/commons/model/liciense/liciense.dart';
import 'package:sathachlaixe/commons/model/liciense/licienses_data.dart';
import 'package:sathachlaixe/screens/exam/domain/model/question.dart';
import 'package:sathachlaixe/screens/home/data/home_list.dart';
import 'package:sathachlaixe/screens/home/domain/model/home_item.dart';
import 'package:sathachlaixe/screens/home/domain/repository/home_repository.dart';

class LocalHomeRepository implements HomeRepository {
  final Box<dynamic> settingBox;
  final Box<ExamBank> examBankBox;
  final Box<Question> questionBox;
  final Box<ExamInfo> examInfoBox;

  LocalHomeRepository({
    required this.settingBox,
    required this.examBankBox,
    required this.questionBox,
    required this.examInfoBox,
  });

  @override
  Future<List<HomeItem>> get listHomeItems => Future.value(HomeList.homeItems);

  @override
  Future<Liciense> get currentLiciense async => await settingBox.get(
    Liciense.currentLicienseKey,
    defaultValue: LiciensesData.licienses.first,
  );
}
