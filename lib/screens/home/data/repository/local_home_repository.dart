import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sathachlaixe/routing/router_utils.dart';
import 'package:sathachlaixe/screens/home/data/home_list.dart';
import 'package:sathachlaixe/screens/home/domain/model/home_item.dart';
import 'package:sathachlaixe/screens/home/domain/repository/home_repository.dart';

class LocalHomeRepository implements HomeRepository {
  // final Box<dynamic> settingBox;

  // LocalHomeRepository({required this.settingBox});

  @override
  Future<List<HomeItem>> get listHomeItems => Future.value(HomeList.homeItems);
}
