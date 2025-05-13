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
  final HomeItemType homeItemType;
  final String itemTitle;
  final String route;
  final String imgUrl;

  const HomeItem({
    required this.homeItemType,
    required this.itemTitle,
    required this.route,
    required this.imgUrl,
  });
}
