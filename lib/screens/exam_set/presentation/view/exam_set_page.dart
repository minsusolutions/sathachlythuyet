import 'package:flutter/material.dart';
import 'package:sathachlaixe/screens/exam_set/presentation/view/exam_set_list_view.dart';
import 'package:sathachlaixe/screens/exam_set/presentation/widget/exam_set_header_view.dart';

class ExamSetPage extends StatelessWidget {
  const ExamSetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [examHeaderView(), Expanded(child: ExamSetListView())],
    );
  }
}
