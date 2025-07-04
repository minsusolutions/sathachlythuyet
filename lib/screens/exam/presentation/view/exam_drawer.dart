import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sathachlaixe/screens/exam/domain/model/answer_status.dart';
import 'package:sathachlaixe/screens/exam/exam.dart';

class ExamDrawer extends StatelessWidget {
  const ExamDrawer({super.key, required this.tabController});
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamBloc, ExamState>(
      builder: (context, state) {
        if (state is ExamLoaded) {
          return SizedBox(
            width: 250,
            child: Drawer(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: GridView.count(
                        crossAxisCount: state.userAnswers.length >= 30 ? 4 : 3,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                        childAspectRatio: 1 / 1,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: List.generate(state.userAnswers.length, (
                          index,
                        ) {
                          return QuestionCircle(
                            answerStatus:
                                state.userAnswers.values
                                    .elementAt(index)
                                    .status,
                            questionIndexInExamSet: index,
                            onTap: () {
                              tabController.animateTo(index);

                              if (Scaffold.of(context).isDrawerOpen) {
                                Scaffold.of(context).closeDrawer();
                              }
                            },
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class QuestionCircle extends StatelessWidget {
  final VoidCallback onTap;
  final AnswerStatus answerStatus;
  final int questionIndexInExamSet;

  const QuestionCircle({
    super.key,
    required this.answerStatus,
    required this.questionIndexInExamSet,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: switch (answerStatus) {
          AnswerStatus.correct => Colors.green,
          AnswerStatus.incorrect => Colors.red,
          AnswerStatus.unanswered => Colors.blueGrey,
        },
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: InkWell(
        onTap: onTap,
        child: Center(child: Text('Câu ${questionIndexInExamSet + 1}')),
      ),
    );
  }
}
