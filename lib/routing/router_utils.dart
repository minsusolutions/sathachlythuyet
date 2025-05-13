enum PAGES { home, exam, setting, exam_set }

extension AppPageExtension on PAGES {
  String get screenPath {
    switch (this) {
      case PAGES.home:
        return '/';
      case PAGES.setting:
        return '/setting';
      case PAGES.exam:
        return '/exam';
      case PAGES.exam_set:
        return '/exam_set';
    }
  }

  String get screenName {
    switch (this) {
      case PAGES.home:
        return "HOME";
      case PAGES.exam:
        return "EXAM";
      case PAGES.setting:
        return "Setting";
      case PAGES.exam_set:
        return "ExamSet";
    }
  }

  String get ScreenTitle {
    switch (this) {
      case PAGES.home:
        return "Sát hạch lái xe";
      case PAGES.setting:
        return "Đổi hạng giấy phép";
      case PAGES.exam:
        return "Exam";
      case PAGES.exam_set:
        return "Đề thi hạng ";
    }
  }
}
