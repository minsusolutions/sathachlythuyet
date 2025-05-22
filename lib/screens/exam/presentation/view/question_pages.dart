import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sathachlaixe/screens/exam/presentation/bloc/exam_bloc.dart';
import 'package:sathachlaixe/screens/exam/presentation/view/single_question_page.dart';
import 'package:sathachlaixe/screens/home/home.dart';

class QuestionPages extends StatefulWidget {
  const QuestionPages({super.key});

  @override
  State<StatefulWidget> createState() => _QuestionPagesState();
}

class _QuestionPagesState extends State<QuestionPages>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamBloc, ExamState>(
      builder: (context, state) {
        print('list question lenght: ${state.listQuestion.length}');
        _tabController = TabController(
          vsync: this,
          length: state.listQuestion.length,
        );

        return Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.amber),
              height: 50,
              child: TabBar(
                padding: EdgeInsets.zero,
                controller: _tabController,
                isScrollable: true,
                tabs: List.generate(state.listQuestion.length, (index) {
                  return Text(
                    'Câu ${state.listQuestion[index].qNumber}',
                    style: TextStyle(color: Colors.red),
                  );
                  // return Tab(height: 50, text: 'Cau ${index + 1}',);
                }),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(color: Colors.grey),
                height: 100,
                child: TabBarView(
                  controller: _tabController,
                  children: List<SingleQuestionPage>.generate(
                    state.listQuestion.length,
                    (i) => SingleQuestionPage(question: state.listQuestion[i]),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

// enum Answer { answer1, answer2, answer3, answer4 }
