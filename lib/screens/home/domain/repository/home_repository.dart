import 'package:sathachlaixe/commons/model/liciense/liciense.dart';
import 'package:sathachlaixe/screens/home/domain/model/home_item.dart';

abstract interface class HomeRepository {
  Future<List<HomeItem>> get listHomeItems;

  Future<Liciense> get currentLiciense;
}
