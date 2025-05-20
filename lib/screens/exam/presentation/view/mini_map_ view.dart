import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:sathachlaixe/screens/exam/presentation/bloc/exam_bloc.dart';

class MiniMapView extends StatelessWidget {
  final _logger = Logger('_MiniMapView');
  @override
  Widget build(BuildContext context) {
    return BlocSelector<ExamBloc, ExamState, Map<int, bool?>>(
      selector: (state) => state.examInfo.questions,
      builder: (context, lists) {
        var listValues = lists.values.toList();

        return Row(
          children: [
            GridView.count(
              crossAxisCount: lists.length >= 30 ? 2 : 2,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: List.generate(lists.length, (index) {
                var itemColor = Colors.blue;
                if (listValues[index] != null) {
                  itemColor = listValues[index]! ? Colors.green : Colors.red;
                }
                return SizedBox(
                  width: 13,
                  height: 13,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: itemColor),
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
