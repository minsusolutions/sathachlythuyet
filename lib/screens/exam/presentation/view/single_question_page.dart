import 'package:flutter/material.dart';
import 'package:sathachlaixe/screens/exam/domain/model/question.dart';

class SingleQuestionPage extends StatefulWidget {
  final text;
  const SingleQuestionPage({super.key, this.text});

  @override
  State<StatefulWidget> createState() => _SingleQuestionPageState();
}

enum Answers { answer1, answer2, answer3, answer4 }

class _SingleQuestionPageState extends State<SingleQuestionPage> {
  var _answer;
  var question = Question(
    qNumber: 1,
    title:
        'Việc vận chuyển động vật sống phải tuân theo những quy định nào dưới đây?',
    answer1:
        'Tùy theo loại động vật sống, người kinh doanh vận tải yêu cầu người thuê vận tải áp tải để chăm sóc trong quá trình vận tải.',
    answer2:
        'Người thuê vận tải chịu trách nhiệm về việc xếp dỡ động vật sống theo hướng dẫn của người kinh doanh vận tải; trường hợp người thuê vận tải không thực hiện được thì phải trả cước, phí xếp, dỡ cho người kinh doanh vận tải.',
    answer3: 'Cả ý 1 và ý 2.',
    answer4: 'Cả 3 ý.',
    qImage: '',
    correctAnswer: 1,
    qCategory: 5,
    qNumberIn200: 1,
    qNumberIn450: 2,
    qNumberIn500: 3,
    extra1: 1,
    extra2: 1,
    extra3: 1,
    extra4: 1,
    isDeadQuestion: false,
    hint: 'Hello hint',
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: buildQuestionView(),
    );
  }

  List<Widget> buildQuestionView() {
    var listWidgets = <Widget>[];

    // add title for
    listWidgets.add(
      Text(
        question.title,
        style: TextStyle(
          color: question.isDeadQuestion ? Colors.red : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    if (question.qImage.isNotEmpty) {
      listWidgets.add(
        Image.asset(
          'assets/questions/${question.qImage}',
          height: 200,
          fit: BoxFit.fill,
        ),
      );
    }
    listWidgets.add(Divider(height: 1, color: Colors.grey));
    if (question.answer1.isNotEmpty) {
      listWidgets.add(
        RadioListTile<Answers>(
          title: Text(
            '1. ${question.answer1}',
            style: TextStyle(
              color: _answer == Answers.answer1 ? Colors.blue : Colors.black,
            ),
          ),
          value: Answers.answer1,
          groupValue: _answer,
          onChanged: (Answers? value) {
            setState(() {
              _answer = value;
            });
          },
        ),
      );
      listWidgets.add(Divider(height: 1, color: Colors.grey));
    }
    if (question.answer2.isNotEmpty) {
      listWidgets.add(
        RadioListTile<Answers>(
          title: Text(
            '2. ${question.answer2}',
            style: TextStyle(
              color: _answer == Answers.answer2 ? Colors.blue : Colors.black,
            ),
          ),
          value: Answers.answer2,
          groupValue: _answer,
          onChanged: (Answers? value) {
            setState(() {
              _answer = value;
            });
          },
        ),
      );
      listWidgets.add(Divider(height: 1, color: Colors.grey));
    }
    if (question.answer3.isNotEmpty) {
      listWidgets.add(
        RadioListTile<Answers>(
          title: Text(
            '3. ${question.answer3}',
            style: TextStyle(
              color: _answer == Answers.answer3 ? Colors.blue : Colors.black,
            ),
          ),
          value: Answers.answer3,
          groupValue: _answer,
          onChanged: (Answers? value) {
            setState(() {
              _answer = value;
            });
          },
        ),
      );
      listWidgets.add(Divider(height: 1, color: Colors.grey));
    }
    if (question.answer4.isNotEmpty) {
      listWidgets.add(
        RadioListTile<Answers>(
          title: Text(
            '4. ${question.answer4}',
            style: TextStyle(
              color: _answer == Answers.answer4 ? Colors.blue : Colors.black,
            ),
          ),
          value: Answers.answer4,
          groupValue: _answer,
          onChanged: (Answers? value) {
            setState(() {
              _answer = value;
            });
          },
        ),
      );
      listWidgets.add(Divider(height: 1, color: Colors.grey));
    }

    return listWidgets;
  }
}
