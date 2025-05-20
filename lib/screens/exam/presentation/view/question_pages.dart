import 'package:flutter/material.dart';
import 'package:sathachlaixe/screens/exam/presentation/view/single_question_page.dart';

class QuestionPages extends StatefulWidget {
  const QuestionPages({super.key, required this.tabController});
  final TabController tabController;

  @override
  State<StatefulWidget> createState() => _QuestionPagesState();
}

class _QuestionPagesState extends State<QuestionPages>
    with SingleTickerProviderStateMixin {
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.amber),
          height: 50,
          child: TabBar(
            padding: EdgeInsets.zero,
            controller: widget.tabController,
            isScrollable: true,
            tabs: List.generate(_list.length, (index) {
              return Text(
                'Cau ${index + 1}',
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
              controller: widget.tabController,
              children: _list,
            ),
          ),
        ),
      ],
    );
  }
}

enum Answer { answer1, answer2, answer3, answer4 }
