import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sathachlaixe/screens/exam_set/presentation/bloc/exam_set_bloc.dart';
import 'package:sathachlaixe/screens/exam_set/presentation/widget/exam_set_item.dart';

class ExamSetListView extends StatelessWidget {
  const ExamSetListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamSetBloc, ExamSetState>(
      builder:
          (context, state) => GridView.count(
            padding: EdgeInsets.all(8),
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            children: List.generate(state.listExamSet.length, (index) {
              return ExamSetItem(examSet: state.listExamSet[index]);
            }),
          ),
    );
  }
}
