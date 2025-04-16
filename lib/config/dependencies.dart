import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sathach/data/repositories/home/home_repository.dart';
import 'package:sathach/data/repositories/setting/setting_repository.dart';
import 'package:sathach/data/services/local_data_service.dart';

List<SingleChildWidget> _sharedProviders = [];

List<SingleChildWidget> get providers {
  return [
    Provider.value(value: LocalDataService()),
    Provider(
      create:
          (context) =>
              HomeRepositoryImpl(localDataService: context.read())
                  as HomeRepository,
    ),
    Provider(
      create:
          (context) =>
              SettingRepositoryImpl(localDataService: context.read())
                  as SettingRepository,
    ),
    ..._sharedProviders,
  ];
}
