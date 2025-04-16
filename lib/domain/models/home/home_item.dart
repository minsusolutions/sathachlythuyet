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
  final String route;
  final String imgUrl;

  HomeItem({
    required this.order,
    required this.homeItemType,
    required this.route,
    required this.imgUrl,
  });
}
