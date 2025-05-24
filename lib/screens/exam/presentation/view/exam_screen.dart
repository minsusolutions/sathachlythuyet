import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sathachlaixe/commons/model/exam_info/exam_info.dart';
import 'package:sathachlaixe/screens/exam/presentation/bloc/exam_bloc.dart';
import 'package:sathachlaixe/screens/exam/presentation/view/exam_drawer.dart';
import 'package:sathachlaixe/screens/exam/presentation/view/exam_top_view.dart';
import 'package:sathachlaixe/screens/exam/presentation/view/question_pages.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({super.key});

  @override
  State<StatefulWidget> createState() => ExamScreenState();
}

class ExamScreenState extends State<ExamScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 8, vsync: this);
    tabController.addListener(() {
      //setState(() {});
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
            return switch (state) {
              ExamInitial _ => '',
              ExamLoaded loadedState => loadedState.examInfo.examTitle,
            };
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
            return switch (state) {
              ExamInitial _ =>
                Container(), //TODO: hanhnv should implement loading screen
              ExamLoaded loaded => Column(
                children: [
                  loaded.examInfo.examType == ExamType.exam
                      ? Container(
                        decoration: BoxDecoration(color: Colors.amber),
                        child: ExamTopView(
                          listData: loaded.examInfo.questionsData,
                        ),
                      )
                      : Container(),
                  Expanded(child: QuestionPages()),
                ],
              ),
            };
          },
        ),
      ),
    );
  }
}
