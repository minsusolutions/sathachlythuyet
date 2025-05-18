import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sathachlaixe/screens/exam_set/presentation/bloc/exam_set_bloc.dart';

class ExamSetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamSetBloc, ExamSetState>(
      builder: (context, state) => Container(),
    );
  }
}
