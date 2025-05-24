import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sathachlaixe/screens/exam/domain/model/question.dart';

part 'single_question_event.dart';
part 'single_question_state.dart';

class SingleQuestionBloc
    extends Bloc<SingleQuestionEvent, SingleQuestionState> {
  SingleQuestionBloc() : super(SingleQuestionInitial()) {
    on<SingleQuestionLoadEvent>(_onSingleQuestionLoaded);
    on<SelectAnswerEvent>(_selectAnswer);
  }

  void _onSingleQuestionLoaded(
    SingleQuestionLoadEvent event,
    Emitter<SingleQuestionState> emitter,
  ) {
    emitter(SingleQuestionLoaded(question: event.question));
  }

  void _selectAnswer(
    SelectAnswerEvent event,
    Emitter<SingleQuestionState> emitter,
  ) {
    final currentState = state;
    if (currentState is SingleQuestionLoaded) {
      final question = currentState.question.copyWith(
        selectedAnswer: event.answer,
      );
      emitter(currentState.copyWith(question: question));
    }
  }
}
