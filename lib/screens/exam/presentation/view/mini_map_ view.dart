import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sathachlaixe/screens/exam/domain/model/question_data.dart';
import 'package:sathachlaixe/screens/exam/presentation/bloc/exam_bloc.dart';

class MiniMapView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocSelector<ExamBloc, ExamState, List<QuestionData>>(
      selector: (state) => state.examInfo.questions,
      builder: (context, lists) {
        return Row(
          children: [
            GridView.count(
              crossAxisCount: lists.length >= 30 ? 2 : 2,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: List.generate(lists.length, (index) {
                return SizedBox(
                  width: 13,
                  height: 13,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: switch (lists[index].questionStatus) {
                        QuestionStatus.unanswer => Colors.blue,
                        QuestionStatus.incorrect => Colors.red,
                        QuestionStatus.correct => Colors.green,
                      },
                    ),
                  ),
                );
              }),
            ),
            SizedBox(width: 10),
            Text('15/ ${lists.length}'),
          ],
        );
      },
    );
  }
}
