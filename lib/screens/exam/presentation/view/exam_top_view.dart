import 'package:flutter/material.dart';
import 'package:sathachlaixe/screens/exam/presentation/view/exam_timer.dart';
import 'package:sathachlaixe/screens/exam/presentation/view/mini_map_%20view.dart';

class ExamTopView extends StatelessWidget {
  const ExamTopView({super.key, required this.listData});
  final List<int> listData;

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
          child: ExamTimerView(),
        ),
      ],
    );
  }
}
