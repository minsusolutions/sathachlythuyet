import 'package:flutter/material.dart';
import 'package:sathachlaixe/routing/router_utils.dart';
import 'package:sathachlaixe/screens/home/domain/model/home_item.dart';

class HomeList {
  static final homeItems = [
    HomeItem(
      itemTitle: 'Đề ngẫu nhiên',
      route: PAGES.exam.screenPath,
      imgUrl: 'assets/drawables/ic_random.svg',
      backgroundColor: Color(0xFF0099CC).toARGB32(),
    ),
    HomeItem(
      itemTitle: 'Thi theo bộ đề',
      route: PAGES.exam_set.screenPath,
      imgUrl: 'assets/drawables/ic_sets.svg',
      backgroundColor: Color(0xFF33b5e5).toARGB32(),
    ),
    HomeItem(
      itemTitle: 'Các câu sai',
      route: PAGES.exam.screenPath,
      imgUrl: 'assets/drawables/ic_wrong.svg',
      backgroundColor: Color(0xFF007e33).toARGB32(),
    ),
    HomeItem(
      itemTitle: 'Ôn tập',
      route: PAGES.exam.screenPath,
      imgUrl: 'assets/drawables/ic_revise.svg',
      backgroundColor: Color(0xFF00c851).toARGB32(),
    ),
    HomeItem(
      itemTitle: 'Biển báo',
      route: PAGES.exam.screenPath,
      imgUrl: 'assets/drawables/ic_signs.svg',
      backgroundColor: Color(0xFFff8800).toARGB32(),
    ),
    HomeItem(
      route: PAGES.exam.screenPath,
      itemTitle: 'Mẹo đi thi',
      imgUrl: 'assets/drawables/ic_tips.svg',
      backgroundColor: Color(0xFFffbb33).toARGB32(),
    ),
    HomeItem(
      route: PAGES.exam.screenPath,
      itemTitle: 'Các câu điểm liệt',
      imgUrl: 'assets/drawables/ic_dead.svg',
      backgroundColor: Color(0xFFff4400).toARGB32(),
    ),
    HomeItem(
      route: PAGES.exam.screenPath,
      itemTitle: 'Thi sa hình',
      imgUrl: 'assets/drawables/ic_top50.svg',
      backgroundColor: Color(0xFFCC0000).toARGB32(),
    ),
  ];
}
