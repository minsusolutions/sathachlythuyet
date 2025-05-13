import 'package:sathachlaixe/screens/home/domain/model/home_item.dart';

abstract interface class HomeRepository {
  Future<List<HomeItem>> get listHomeItems;
}
