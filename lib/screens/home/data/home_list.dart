import 'package:flutter/material.dart';
import 'package:sathachlaixe/routing/router_utils.dart';
import 'package:sathachlaixe/screens/home/domain/model/home_item.dart';

class HomeList {
  static final homeItems = [
    HomeItem(
      jobCode: 0,
      itemTitle: PAGES.exam.screenTitle,
      route: PAGES.exam.screenPath,
      imgUrl: 'assets/drawables/ic_random.svg',
      backgroundColor: Color(0xFF0099CC).toARGB32(),
    ),
    HomeItem(
      jobCode: 1,
      itemTitle: PAGES.examSet.screenTitle,
      route: PAGES.examSet.screenPath,
      imgUrl: 'assets/drawables/ic_sets.svg',
      backgroundColor: Color(0xFF33b5e5).toARGB32(),
    ),
    HomeItem(
      jobCode: 2,
      itemTitle: PAGES.wrong.screenTitle,
      route: PAGES.wrong.screenPath,
      imgUrl: 'assets/drawables/ic_wrong.svg',
      backgroundColor: Color(0xFF007e33).toARGB32(),
    ),
    HomeItem(
      jobCode: 3,
      itemTitle: PAGES.revise.screenTitle,
      route: PAGES.revise.screenPath,
      imgUrl: 'assets/drawables/ic_revise.svg',
      backgroundColor: Color(0xFF00c851).toARGB32(),
    ),
    HomeItem(
      jobCode: 4,
      itemTitle: PAGES.signs.screenTitle,
      route: PAGES.signs.screenPath,
      imgUrl: 'assets/drawables/ic_signs.svg',
      backgroundColor: Color(0xFFff8800).toARGB32(),
    ),
    HomeItem(
      jobCode: 5,
      route: PAGES.tips.screenPath,
      itemTitle: PAGES.tips.screenTitle,
      imgUrl: 'assets/drawables/ic_tips.svg',
      backgroundColor: Color(0xFFffbb33).toARGB32(),
    ),
    HomeItem(
      jobCode: 6,
      route: PAGES.dead.screenPath,
      itemTitle: PAGES.dead.screenTitle,
      imgUrl: 'assets/drawables/ic_dead.svg',
      backgroundColor: Color(0xFFff4400).toARGB32(),
    ),
    HomeItem(
      jobCode: 7,
      route: PAGES.top50.screenPath,
      itemTitle: PAGES.top50.screenTitle,
      imgUrl: 'assets/drawables/ic_top50.svg',
      backgroundColor: Color(0xFFCC0000).toARGB32(),
    ),
  ];
}
