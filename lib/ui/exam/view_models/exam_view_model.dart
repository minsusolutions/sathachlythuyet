import 'package:flutter/material.dart';

import '../../../domain/models/question.dart';

class ExamViewModel extends ChangeNotifier {
  List<Question> questions = [
    Question(
      qNumber: '1',
      title: '1 + 1 = ?',
      answer1: '1',
      answer2: '2',
      answer3: '3',
      answer4: '4',
      qImage: '',
      correctAnswer: '1',
      qCategory: '5',
      qNumberIn200: '1',
      qNumberIn450: '2',
      qNumberIn500: '3',
      booF1: '1',
      booF2: '1',
      booF3: '1',
      booF4: '1',
      isDeadQuestion: true,
    ),
    Question(
      qNumber: '2',
      title: '1 + 1 = ?',
      answer1: '1',
      answer2: '2',
      answer3: '3',
      answer4: '4',
      qImage: '',
      correctAnswer: '1',
      qCategory: '5',
      qNumberIn200: '1',
      qNumberIn450: '2',
      qNumberIn500: '3',
      booF1: '1',
      booF2: '1',
      booF3: '1',
      booF4: '1',
      isDeadQuestion: true,
    ),
  ];
}
