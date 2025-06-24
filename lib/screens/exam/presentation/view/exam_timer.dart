import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sathachlaixe/screens/exam/presentation/bloc/exam_bloc.dart';

class ExamTimerView extends StatelessWidget {
  const ExamTimerView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamBloc, ExamState>(
      buildWhen: (previous, current) {
        if (previous is ExamLoaded && current is ExamLoaded) {
          return previous.remainingDuration != current.remainingDuration;
        }
        return false;
      },

      builder: (context, state) {
        if (state is ExamLoaded) {
          final duration = state.remainingDuration;
          final minutesStr = ((duration / 60) % 60).floor().toString().padLeft(
            2,
            '0',
          );
          final secondsStr = (duration % 60).floor().toString().padLeft(2, '0');
          return Text(
            '$minutesStr:$secondsStr',
            style: Theme.of(context).textTheme.headlineMedium,
          );
        }
        return Container();
      },
    );
  }
}
