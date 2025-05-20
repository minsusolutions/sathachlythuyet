import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sathachlaixe/screens/exam/presentation/bloc/exam_bloc.dart';
import 'package:sathachlaixe/screens/exam/presentation/view/mini_map_%20view.dart';

class ExamTopView extends StatelessWidget {
  const ExamTopView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamBloc, ExamState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                height: 50,
                child: Container(
                  height: 26,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: MiniMapView(),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 10),
              alignment: Alignment.centerRight,
              child: Text('19:33'),
            ),
          ],
        );
      },
    );
  }
}
