enum PAGE {
  splash,
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

extension AppPageExtension on PAGE {
  String get screenPath {
    switch (this) {
      case PAGE.splash:
        return '/';
      case PAGE.home:
        return '/home';
      case PAGE.setting:
        return '/setting';
      case PAGE.exam:
        return '/exam';
      case PAGE.examSet:
        return '/exam_set';
      case PAGE.signs:
        return "/exam";
      case PAGE.tips:
        return "/tip";
      case PAGE.dead:
        return "/exam";
      case PAGE.top50:
        return "/exam";
      case PAGE.wrong:
        return "/exam";
      case PAGE.revise:
        return "/revise";
    }
  }

  String get screenName {
    switch (this) {
      case PAGE.splash:
        return 'SPLASH';
      case PAGE.home:
        return "HOME";
      case PAGE.exam:
        return "EXAM";
      case PAGE.setting:
        return "SETTING";
      case PAGE.examSet:
        return "EXAMSET";
      case PAGE.signs:
        return "SIGNS";
      case PAGE.tips:
        return "TIPS";
      case PAGE.dead:
        return "DEAD";
      case PAGE.top50:
        return "TOP50";
      case PAGE.wrong:
        return "WRONG";
      case PAGE.revise:
        return "REVISE";
    }
  }

  String get screenTitle {
    switch (this) {
      case PAGE.splash:
        return "Splash";
      case PAGE.home:
        return "Sát hạch lái xe";
      case PAGE.setting:
        return "Đổi hạng giấy phép";
      case PAGE.exam:
        return "Đề thi ngẫu nhiên";
      case PAGE.examSet:
        return "Bộ đề thi";
      case PAGE.signs:
        return "Các biển báo";
      case PAGE.tips:
        return "Mẹo đi thi";
      case PAGE.dead:
        return "Các câu điểm liệt";
      case PAGE.top50:
        return "Top 50 câu sai";
      case PAGE.wrong:
        return "Các câu sai";
      case PAGE.revise:
        return "Ôn tập";
    }
  }

  // int get extraValue {
  //   switch (this) {

  //     case PAGE.home:
  //       return 0;
  //     case PAGE.setting:
  //       return 1;
  //     case PAGE.exam:
  //       return 2;
  //     case PAGE.examSet:
  //       return 3;
  //     case PAGE.tips:
  //       return 4;
  //     case PAGE.signs:
  //       return 5;
  //     case PAGE.dead:
  //       return 6;
  //     case PAGE.top50:
  //       return 7;
  //     case PAGE.wrong:
  //       return 8;
  //     case PAGE.revise:
  //       return 9;
  //   }
  // }
}
