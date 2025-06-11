import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sathachlaixe/screens/exam/domain/model/answer_status.dart';
import 'package:sathachlaixe/screens/exam/exam.dart';

class MiniMapView extends StatelessWidget {
  const MiniMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamBloc, ExamState>(
      buildWhen: (previous, current) {
        return true;
      },
      builder: (context, state) {
        if (state is ExamLoaded) {
          return Row(
            children: [
              GridView.count(
                crossAxisCount: state.userAnswers.length >= 30 ? 2 : 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: List.generate(state.userAnswers.length, (index) {
                  return SizedBox(
                    width: 13,
                    height: 13,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: switch (state.userAnswers.values
                            .elementAt(index)
                            .status) {
                          AnswerStatus.incorrect => Colors.red,
                          AnswerStatus.correct => Colors.green,
                          AnswerStatus.unanswered => Colors.grey,
                        },
                      ),
                    ),
                  );
                }),
              ),
            ],
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
