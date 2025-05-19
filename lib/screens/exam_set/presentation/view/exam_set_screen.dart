import 'package:flutter/material.dart';
import 'package:sathachlaixe/commons/base_app_bar.dart';
import 'package:sathachlaixe/screens/exam_set/presentation/view/exam_set_page.dart';

class ExamSetScreen extends StatelessWidget {
  const ExamSetScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: Text(title), appBar: AppBar(), widgets: []),
      body: const ExamSetPage(),
    );
  }
}
