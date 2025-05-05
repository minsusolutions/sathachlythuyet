import 'package:sathachlaixe/routing/router_utils.dart';

enum HomeItemType {
  random,
  examSets,
  wrongAnswers,
  revise,
  signs,
  tips,
  deadQuestions,
  top50Wrong,
}

class HomeItem {
  final int order;
  final HomeItemType homeItemType;
  final String itemTitle;
  final String route;
  final String imgUrl;

  const HomeItem({
    required this.order,
    required this.homeItemType,
    required this.itemTitle,
    required this.route,
    required this.imgUrl,
  });

  static List<HomeItem> getList() {
    return [
      HomeItem(
        order: 0,
        homeItemType: HomeItemType.random,
        itemTitle: 'Đề ngẫu nhiên',
        route: PAGES.exam.screenPath,
        imgUrl: 'assets/drawables/ic_random.svg',
      ),
      HomeItem(
        order: 1,
        homeItemType: HomeItemType.examSets,
        itemTitle: 'Thi theo bộ đề',
        route: PAGES.exam.screenPath,
        imgUrl: 'assets/drawables/ic_sets.svg',
      ),
      HomeItem(
        order: 2,
        homeItemType: HomeItemType.wrongAnswers,
        itemTitle: 'Các câu sai',
        route: PAGES.exam.screenPath,
        imgUrl: 'assets/drawables/ic_wrong.svg',
      ),
      HomeItem(
        order: 3,
        homeItemType: HomeItemType.revise,
        itemTitle: 'Ôn tập',
        route: PAGES.exam.screenPath,
        imgUrl: 'assets/drawables/ic_revise.svg',
      ),
      HomeItem(
        order: 4,
        homeItemType: HomeItemType.signs,
        itemTitle: 'Biển báo',
        route: PAGES.exam.screenPath,
        imgUrl: 'assets/drawables/ic_signs.svg',
      ),
      HomeItem(
        order: 5,
        homeItemType: HomeItemType.tips,
        route: PAGES.exam.screenPath,
        itemTitle: 'Mẹo đi thi',
        imgUrl: 'assets/drawables/ic_tips.svg',
      ),
      HomeItem(
        order: 6,
        homeItemType: HomeItemType.deadQuestions,
        route: PAGES.exam.screenPath,
        itemTitle: 'Các câu điểm liệt',
        imgUrl: 'assets/drawables/ic_dead.svg',
      ),
      HomeItem(
        order: 7,
        homeItemType: HomeItemType.top50Wrong,
        route: PAGES.exam.screenPath,
        itemTitle: 'Thi sa hình',
        imgUrl: 'assets/drawables/ic_top50.svg',
      ),
    ];
  }
}
