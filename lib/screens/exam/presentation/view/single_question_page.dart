import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sathachlaixe/screens/exam/domain/model/question.dart';
import 'package:sathachlaixe/screens/exam/presentation/bloc/mini_map/mini_map_bloc.dart';
import 'package:sathachlaixe/screens/exam/presentation/bloc/single_question_bloc/single_question_bloc.dart';

class SingleQuestionPage extends StatefulWidget {
  const SingleQuestionPage({super.key, required this.question});
  final Question question;

  State<StatefulWidget> createState() => _SingleQuestionPageState();
}

class _SingleQuestionPageState extends State<SingleQuestionPage>
    with AutomaticKeepAliveClientMixin<SingleQuestionPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              SingleQuestionBloc()
                ..add(SingleQuestionLoadEvent(question: widget.question)),
      child: BlocConsumer<SingleQuestionBloc, SingleQuestionState>(
        listener: (context, state) {
          final currentState = state;
          if (currentState is SingleQuestionLoaded) {
            if (currentState.question.selectedAnswer > 0) {
              var correct =
                  currentState.question.correctAnswer ==
                  currentState.question.selectedAnswer;
              print('Tra loi: $correct');
              //context.read<HomeBloc>().add(Update)
              context.read<MiniMapBloc>().add(
                MiniMapUpdateStatus(
                  questionId: currentState.question.qNumber,
                  correct: correct,
                ),
              );
            }
          }
        },
        builder:
            (context, state) => switch (state) {
              SingleQuestionInitial() => Container(),
              SingleQuestionLoaded() => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: buildQuestionView(context, state.question),
              ),
            },
      ),
    );
  }

  List<Widget> buildQuestionView(BuildContext context, Question question) {
    var listWidgets = <Widget>[];
    int? selectedAnswer = question.selectedAnswer;

    // add title for
    listWidgets.add(
      Text(
        question.title,
        style: TextStyle(
          color: question.isDeadQuestion ? Color(0XFF8B0000) : Colors.black,
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
              color:
                  question.selectedAnswer == 1
                      ? Color(0xFF111184)
                      : Colors.black,
              fontWeight:
                  question.selectedAnswer == 1
                      ? FontWeight.bold
                      : FontWeight.normal,
            ),
          ),
          value: 1,
          groupValue: selectedAnswer,
          onChanged: (value) {
            if (selectedAnswer! > 0) return;
            selectedAnswer = value;
            context.read<SingleQuestionBloc>().add(
              SelectAnswerEvent(answer: value!),
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
              color:
                  question.selectedAnswer == 2
                      ? Color(0xFF111184)
                      : Colors.black,
              fontWeight:
                  question.selectedAnswer == 2
                      ? FontWeight.bold
                      : FontWeight.normal,
            ),
          ),
          value: 2,
          groupValue: selectedAnswer,
          onChanged: (value) {
            if (selectedAnswer! > 0) return;
            selectedAnswer = value;
            context.read<SingleQuestionBloc>().add(
              SelectAnswerEvent(answer: value!),
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
              color:
                  question.selectedAnswer == 4
                      ? Color(0xFF111184)
                      : Colors.black,
              fontWeight:
                  question.selectedAnswer == 4
                      ? FontWeight.bold
                      : FontWeight.normal,
            ),
          ),
          value: 4,
          groupValue: selectedAnswer,
          onChanged: (value) {
            if (selectedAnswer! > 0) return;

            selectedAnswer = value;
            context.read<SingleQuestionBloc>().add(
              SelectAnswerEvent(answer: value!),
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
              color:
                  question.selectedAnswer == 8
                      ? Color(0xFF111184)
                      : Colors.black,
              fontWeight:
                  question.selectedAnswer == 8
                      ? FontWeight.bold
                      : FontWeight.normal,
            ),
          ),
          value: 8,
          groupValue: selectedAnswer,
          onChanged: (value) {
            if (selectedAnswer! > 0) return;

            selectedAnswer = value;
            context.read<SingleQuestionBloc>().add(
              SelectAnswerEvent(answer: value!),
            );
          },
        ),
      );
      listWidgets.add(Divider(height: 1, color: Colors.grey));
    }

    return listWidgets;
  }

  @override
  bool get wantKeepAlive => true;
}
