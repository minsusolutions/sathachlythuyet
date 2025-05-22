enum PAGES {
  home,
  exam,
  setting,
  examSet,
  signs,
  tips,
  dead,
  top50,
  wrong,
  revise,
}

extension AppPageExtension on PAGES {
  String get screenPath {
    switch (this) {
      case PAGES.home:
        return '/';
      case PAGES.setting:
        return '/setting';
      case PAGES.exam:
        return '/exam';
      case PAGES.examSet:
        return '/exam_set';
      case PAGES.signs:
        return "/exam";
      case PAGES.tips:
        return "/tip";
      case PAGES.dead:
        return "/exam";
      case PAGES.top50:
        return "/exam";
      case PAGES.wrong:
        return "/exam";
      case PAGES.revise:
        return "/revise";
    }
  }

  String get screenName {
    switch (this) {
      case PAGES.home:
        return "HOME";
      case PAGES.exam:
        return "EXAM";
      case PAGES.setting:
        return "SETTING";
      case PAGES.examSet:
        return "EXAMSET";
      case PAGES.signs:
        return "SIGNS";
      case PAGES.tips:
        return "TIPS";
      case PAGES.dead:
        return "DEAD";
      case PAGES.top50:
        return "TOP50";
      case PAGES.wrong:
        return "WRONG";
      case PAGES.revise:
        return "REVISE";
    }
  }

  String get screenTitle {
    switch (this) {
      case PAGES.home:
        return "Sát hạch lái xe";
      case PAGES.setting:
        return "Đổi hạng giấy phép";
      case PAGES.exam:
        return "Đề thi ngẫu nhiên";
      case PAGES.examSet:
        return "Bộ đề thi";
      case PAGES.signs:
        return "Các biển báo";
      case PAGES.tips:
        return "Mẹo đi thi";
      case PAGES.dead:
        return "Các câu điểm liệt";
      case PAGES.top50:
        return "Top 50 câu sai";
      case PAGES.wrong:
        return "Các câu sai";
      case PAGES.revise:
        return "Ôn tập";
    }
  }

  int get extraValue {
    switch (this) {
      case PAGES.home:
        return 0;
      case PAGES.setting:
        return 1;
      case PAGES.exam:
        return 2;
      case PAGES.examSet:
        return 3;
      case PAGES.tips:
        return 4;
      case PAGES.signs:
        return 5;
      case PAGES.dead:
        return 6;
      case PAGES.top50:
        return 7;
      case PAGES.wrong:
        return 8;
      case PAGES.revise:
        return 9;
    }
  }
}
