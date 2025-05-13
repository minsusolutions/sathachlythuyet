import 'package:sathachlaixe/routing/router_utils.dart';
import 'package:sathachlaixe/screens/home/domain/model/home_item.dart';
import 'package:sathachlaixe/screens/home/domain/repository/home_repository.dart';

class LocalHomeRepository implements HomeRepository {
  @override
  Future<List<HomeItem>> get listHomeItems => Future.value([
    HomeItem(
      homeItemType: HomeItemType.random,
      itemTitle: 'Đề ngẫu nhiên',
      route: PAGES.exam.screenPath,
      imgUrl: 'assets/drawables/ic_random.svg',
    ),
    HomeItem(
      homeItemType: HomeItemType.examSets,
      itemTitle: 'Thi theo bộ đề',
      route: PAGES.exam_set.screenPath,
      imgUrl: 'assets/drawables/ic_sets.svg',
    ),
    HomeItem(
      homeItemType: HomeItemType.wrongAnswers,
      itemTitle: 'Các câu sai',
      route: PAGES.exam.screenPath,
      imgUrl: 'assets/drawables/ic_wrong.svg',
    ),
    HomeItem(
      homeItemType: HomeItemType.revise,
      itemTitle: 'Ôn tập',
      route: PAGES.exam.screenPath,
      imgUrl: 'assets/drawables/ic_revise.svg',
    ),
    HomeItem(
      homeItemType: HomeItemType.signs,
      itemTitle: 'Biển báo',
      route: PAGES.exam.screenPath,
      imgUrl: 'assets/drawables/ic_signs.svg',
    ),
    HomeItem(
      homeItemType: HomeItemType.tips,
      route: PAGES.exam.screenPath,
      itemTitle: 'Mẹo đi thi',
      imgUrl: 'assets/drawables/ic_tips.svg',
    ),
    HomeItem(
      homeItemType: HomeItemType.deadQuestions,
      route: PAGES.exam.screenPath,
      itemTitle: 'Các câu điểm liệt',
      imgUrl: 'assets/drawables/ic_dead.svg',
    ),
    HomeItem(
      homeItemType: HomeItemType.top50Wrong,
      route: PAGES.exam.screenPath,
      itemTitle: 'Thi sa hình',
      imgUrl: 'assets/drawables/ic_top50.svg',
    ),
  ]);
}
