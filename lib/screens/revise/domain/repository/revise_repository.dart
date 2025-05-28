import 'package:sathachlaixe/screens/revise/domain/data/chapter.dart';

abstract interface class ReviseRepository {
  Future<List<Chapter>> getChapterListBaseOnLiciense();
}
