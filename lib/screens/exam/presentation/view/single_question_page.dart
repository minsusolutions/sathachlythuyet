import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sathachlaixe/screens/exam/domain/model/question.dart';
import 'package:sathachlaixe/screens/exam/presentation/bloc/exam_bloc.dart';

class SingleQuestionPage extends StatelessWidget {
  SingleQuestionPage({super.key, required this.question});
  final Question question;
  int? _answer;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: buildQuestionView(context),
    );
  }

  List<Widget> buildQuestionView(BuildContext context) {
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
        RadioListTile<int>(
          title: Text(
            '1. ${question.answer1}',
            style: TextStyle(
              color: question.selectedAnswer == 1 ? Colors.blue : Colors.black,
            ),
          ),
          value: 1,
          groupValue: _answer,
          onChanged: (value) {
            print(value);
            context.read<ExamBloc>().add(
              ExamChangeAnswer(question: question, answer: value!),
            );
          },
        ),
      );
      listWidgets.add(Divider(height: 1, color: Colors.grey));
    }
    if (question.answer2.isNotEmpty) {
      listWidgets.add(
        RadioListTile<int>(
          title: Text(
            '2. ${question.answer2}',
            style: TextStyle(
              color: question.selectedAnswer == 2 ? Colors.blue : Colors.black,
            ),
          ),
          value: 1,
          groupValue: _answer,
          onChanged: (value) {
            print(value);
            _answer = value;
            context.read<ExamBloc>().add(
              ExamChangeAnswer(question: question, answer: value!),
            );
          },
        ),
      );
      listWidgets.add(Divider(height: 1, color: Colors.grey));
    }
    if (question.answer3.isNotEmpty) {
      listWidgets.add(
        RadioListTile<int>(
          title: Text(
            '3. ${question.answer3}',
            style: TextStyle(
              color: question.selectedAnswer == 4 ? Colors.blue : Colors.black,
            ),
          ),
          value: 4,
          groupValue: _answer,
          onChanged: (value) {
            _answer = value;
            context.read<ExamBloc>().add(
              ExamChangeAnswer(question: question, answer: value!),
            );
          },
        ),
      );
      listWidgets.add(Divider(height: 1, color: Colors.grey));
    }
    if (question.answer4.isNotEmpty) {
      listWidgets.add(
        RadioListTile<int>(
          title: Text(
            '4. ${question.answer4}',
            style: TextStyle(
              color: question.selectedAnswer == 8 ? Colors.blue : Colors.black,
            ),
          ),
          value: 8,
          groupValue: _answer,
          onChanged: (value) {
            _answer = value;
            print(value);
            context.read<ExamBloc>().add(
              ExamChangeAnswer(question: question, answer: value!),
            );
          },
        ),
      );
      listWidgets.add(Divider(height: 1, color: Colors.grey));
    }

    return listWidgets;
  }
}
