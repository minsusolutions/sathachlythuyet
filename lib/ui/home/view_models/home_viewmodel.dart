import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:sathach/domain/models/home/home_item.dart';

import '../../../data/repositories/home/home_repository.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required HomeRepository homeRepository})
    : _homeRepository = homeRepository {
    loadHomeItems();

  }

  final _log = Logger('HomeViewModel');
  final HomeRepository _homeRepository;

  List<HomeItem> _homeItems = [];

  List<HomeItem> get homeItems => _homeItems;

  loadHomeItems() {
    _log.info("loadHomeItems");
    _homeItems = _homeRepository.getHomeItems();
  }
}
