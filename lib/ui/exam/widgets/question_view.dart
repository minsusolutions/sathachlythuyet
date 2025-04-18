import 'package:flutter/material.dart';

class QuestionView extends StatefulWidget {
  const QuestionView({super.key});

  @override
  State<StatefulWidget> createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(color: Colors.red));
  }
}
