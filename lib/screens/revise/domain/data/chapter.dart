import 'package:equatable/equatable.dart';

enum ChapterType {
  all,
  chapter1,
  chapter2,
  chapter3,
  chapter4,
  chapter5,
  chapter6,
  situation,
}

class Chapter extends Equatable {
  final ChapterType chapterType;
  final List<int> questions;
  final String chapterDescDetail;

  const Chapter({
    required this.chapterType,
    required this.questions,
    required this.chapterDescDetail,
  });

  @override
  List<Object?> get props => [chapterType, questions];
}

extension ChapterTypeExtension on ChapterType {
  int get chapterCode {
    switch (this) {
      case ChapterType.all:
        return 0;
      case ChapterType.chapter1:
        return 1;
      case ChapterType.chapter2:
        return 2;
      case ChapterType.chapter3:
        return 3;
      case ChapterType.chapter4:
        return 4;
      case ChapterType.chapter5:
        return 5;
      case ChapterType.chapter6:
        return 6;
      case ChapterType.situation:
        return 7;
    }
  }

  String get chapterTitle {
    switch (this) {
      case ChapterType.all:
        return 'Toàn bộ';
      case ChapterType.chapter1:
        return 'Chương I: Quy định chung và quy tắc giao thông đường bộ';
      case ChapterType.chapter2:
        return 'Chương II: Văn hoá giao thông, đạo đức người lái xe, kỹ năng phòng cháy, chữa cháy và cứu hộ cứu nạn';
      case ChapterType.chapter3:
        return 'Chương III: Kỹ thuật lái xe';
      case ChapterType.chapter4:
        return 'Chương IV: Cấu tạo và sửa chữa';
      case ChapterType.chapter5:
        return 'Chương V: Báo hiệu đường bộ';
      case ChapterType.chapter6:
        return 'Chương VI. Giải thế sa hình và kỹ năng xử lý tình huống giao thông';
      case ChapterType.situation:
        return '60 câu hỏi về xử lý tình huống mất an toàn giao thông nghiêm trọng';
    }
  }
}
