import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sathachlaixe/screens/exam/presentation/bloc/exam_bloc.dart';
import 'package:sathachlaixe/screens/exam/presentation/bloc/timer/timer_bloc.dart';

class ExamTimerView extends StatefulWidget {
  const ExamTimerView({super.key});

  @override
  State<StatefulWidget> createState() => _ExamTimerView();
}

class _ExamTimerView extends State<ExamTimerView> {
  @override
  void initState() {
    final state = context.read<ExamBloc>().state;
    final duration = switch (state) {
      ExamLoaded loaded => loaded.examInfo.duration,
      ExamInitial _ => 20 * 60,
    };
    print('duration is: ${duration / 60} mins');
    context.read<TimerBloc>().add(TimerStarted(duration: duration));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TimerBloc, TimerState>(
      listenWhen: (previous, current) {
        return (current is TimerRunComplete);
      },
      listener: (context, state) {
        print('chay xong timer roi do anh em oi');
      },
      builder: (context, state) {
        final duration = state.duration;
        final minutesStr = ((duration / 60) % 60).floor().toString().padLeft(
          2,
          '0',
        );
        final secondsStr = (duration % 60).floor().toString().padLeft(2, '0');
        return Text(
          '$minutesStr:$secondsStr',
          style: Theme.of(context).textTheme.headlineMedium,
        );
      },
    );
  }
}
