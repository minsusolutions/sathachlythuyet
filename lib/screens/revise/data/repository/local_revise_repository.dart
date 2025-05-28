import 'package:sathachlaixe/screens/revise/data/repository/local_revise_data.dart';
import 'package:sathachlaixe/screens/revise/domain/data/chapter.dart';
import 'package:sathachlaixe/screens/revise/domain/repository/revise_repository.dart';

class LocalReviseRepository implements ReviseRepository {
  @override
  Future<List<Chapter>> getChapterListBaseOnLiciense() =>
      Future.value(ReviseList.reviseList);
}
