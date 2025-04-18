import 'package:flutter/material.dart';

import 'mini_map.dart';

class ExamTopView extends StatelessWidget {
  const ExamTopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            height: 50,
            child: Container(
              height: 26,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: MiniMapView(),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(right: 10),
          alignment: Alignment.centerRight,
          child: Text('19:33'),
        ),
      ],
    );
  }
}
