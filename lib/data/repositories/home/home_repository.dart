import 'package:sathach/data/services/local_data_service.dart';
import 'package:sathach/domain/models/home/home_item.dart';

abstract class HomeRepository {
  List<HomeItem> getHomeItems();
}

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({required LocalDataService localDataService})
    : _localDataService = localDataService;

  final LocalDataService _localDataService;

  @override
  List<HomeItem> getHomeItems() {
    return _localDataService.getHomeItems();
  }
}
