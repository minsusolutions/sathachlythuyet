import 'package:flutter/material.dart';
import 'package:sathachlaixe/screens/exam_set/domain/model/exam_set.dart';
import 'package:sathachlaixe/screens/exam_set/presentation/widget/status_count_view.dart';

class ExamSetItem extends StatelessWidget {
  final ExamSet examSet;

  const ExamSetItem({super.key, required this.examSet});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Đề thi số'),
            Text(
              '${examSet.setId}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                statusCoundView(examSet.numberOfFailed, false),
                SizedBox(width: 30),
                statusCoundView(examSet.numberOfSucceed, true),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
