import 'package:flutter/material.dart';
import 'package:sathachlaixe/commons/model/exam_info/exam_info.dart';
import 'package:sathachlaixe/routing/router.dart';

class ExamSetItem extends StatelessWidget {
  final ExamInfo examSet;

  const ExamSetItem({super.key, required this.examSet});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          AppRouter.router.push(PAGES.exam.screenPath, extra: examSet);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Đề thi số'),
            Text(
              '${examSet.examSetId}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // statusCoundView(examSet., false),
                // SizedBox(width: 30),
                // statusCoundView(examSet.numberOfSucceed, true),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
