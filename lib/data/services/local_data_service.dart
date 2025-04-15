import 'package:logging/logging.dart';
import 'package:sathach/domain/models/home/home_item.dart';

import '../../routing/router.dart';

class LocalDataService {
  final _logger = Logger("LocalDataService");


  List<HomeItem> getHomeItems() {
    return [
      HomeItem(
        order: 0,
        title: 'Đề ngẫu nhiên',
        route: Routes.exam,
        imgUrl: 'assets/icons/ic_random.svg',
      ),
      HomeItem(
        order: 1,
        title: 'Thi theo bộ đề',
        route: Routes.examSets,
        imgUrl: 'assets/icons/ic_sets.svg',
      ),
      HomeItem(
        order: 2,
        title: 'Xem câu bị sai',
        route: Routes.wrongAnswers,
        imgUrl: 'assets/icons/ic_wrong.svg',
      ),
      HomeItem(
        order: 3,
        title: 'Ôn tập câu hỏi',
        route: Routes.revise,
        imgUrl: 'assets/icons/ic_revise.svg',
      ),
      HomeItem(
        order: 4,
        title: 'Các biển báo',
        route: Routes.signs,
        imgUrl: 'assets/icons/ic_signs.svg',
      ),
      HomeItem(
        order: 5,
        title: 'Mẹo ghi nhớ',
        route: Routes.tips,
        imgUrl: 'assets/icons/ic_tips.svg',
      ),
      HomeItem(
        order: 6,
        title: '60 câu điểm liệt',
        route: Routes.deadQuestions,
        imgUrl: 'assets/icons/ic_dead.svg',
      ),
      HomeItem(
        order: 7,
        title: 'Top 50 câu sai',
        route: Routes.top50WrongAnswers,
        imgUrl: 'assets/icons/ic_top50.svg',
      ),
    ];
  }
}
