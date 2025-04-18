import 'package:flutter/material.dart';
import 'package:sathach/ui/exam/widgets/question_view.dart';
import 'exam_top_view.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({super.key});
  final bool isInExamMode = false;

  @override
  State<StatefulWidget> createState() => ExamScreenState();
}

class ExamScreenState extends State<ExamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Build the title here'),
        actions: [
          Icon(Icons.face_retouching_off_rounded),
          Icon(Icons.checklist_rounded),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            widget.isInExamMode
                ? Container(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: ExamTopView(),
                )
                : Container(),
            Expanded(child: QuestionView()),
          ],
        ),
      ),
    );
  }
}
