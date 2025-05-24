part of 'single_question_bloc.dart';

sealed class SingleQuestionEvent extends Equatable {
  const SingleQuestionEvent();

  @override
  List<Object> get props => [];
}

class SingleQuestionLoadEvent extends SingleQuestionEvent {
  final Question question;

  const SingleQuestionLoadEvent({required this.question});
}

class SelectAnswerEvent extends SingleQuestionEvent {
  final int answer;

  const SelectAnswerEvent({required this.answer});
}
