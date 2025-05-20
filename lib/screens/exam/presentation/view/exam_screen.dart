import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sathachlaixe/screens/exam/domain/model/exam_info.dart';
import 'package:sathachlaixe/screens/exam/presentation/bloc/exam_bloc.dart';
import 'package:sathachlaixe/screens/exam/presentation/view/exam_drawer.dart';
import 'package:sathachlaixe/screens/exam/presentation/view/exam_top_view.dart';
import 'package:sathachlaixe/screens/exam/presentation/view/question_pages.dart';
import 'package:sathachlaixe/screens/exam/presentation/view/single_question_page.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({super.key});

  @override
  State<StatefulWidget> createState() => ExamScreenState();
}

class ExamScreenState extends State<ExamScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  final List<Widget> _list = <Widget>[
    new Center(child: new SingleQuestionPage(text: "Page 1")),
    new Center(child: new SingleQuestionPage(text: "Page 2")),
    new Center(child: new SingleQuestionPage(text: "Page 3")),
    new Center(child: new SingleQuestionPage(text: "Page 4")),

    new Center(child: new SingleQuestionPage(text: "Page 5")),
    new Center(child: new SingleQuestionPage(text: "Page 6")),
    new Center(child: new SingleQuestionPage(text: "Page 7")),
    new Center(child: new SingleQuestionPage(text: "Page 8")),

    new Center(child: new SingleQuestionPage(text: "Page 9")),
    new Center(child: new SingleQuestionPage(text: "Page 10")),
    new Center(child: new SingleQuestionPage(text: "Page 11")),
    new Center(child: new SingleQuestionPage(text: "Page 12")),

    new Center(child: new SingleQuestionPage(text: "Page 13")),
    new Center(child: new SingleQuestionPage(text: "Page 14")),
    new Center(child: new SingleQuestionPage(text: "Page 15")),
    new Center(child: new SingleQuestionPage(text: "Page 16")),
  ];
  @override
  void initState() {
    tabController = TabController(length: _list.length, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: BlocSelector<ExamBloc, ExamState, String>(
          selector: (state) {
            return state.examInfo.examTitle;
          },
          builder: (context, state) {
            return AppBar(
              title: Text(state),
              actions: [
                Icon(Icons.face_retouching_off_rounded),
                Icon(Icons.checklist_rounded),
              ],
            );
          },
        ),
      ),
      drawer: ExamDrawer(tabController: tabController),
      body: SafeArea(
        child: BlocBuilder<ExamBloc, ExamState>(
          builder: (context, state) {
            return Column(
              children: [
                state.examInfo.examType == ExamType.exam
                    ? Container(
                      decoration: BoxDecoration(color: Colors.amber),
                      child: ExamTopView(),
                    )
                    : Container(),
                Expanded(child: QuestionPages(tabController: tabController)),
              ],
            );
          },
        ),
      ),
    );
  }
}
