import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logging/logging.dart';
import 'package:sathachlaixe/screens/exam/domain/model/question_data.dart';

part 'mini_map_event.dart';
part 'mini_map_state.dart';

class MiniMapBloc extends Bloc<MiniMapEvent, MiniMapState> {
  final _logger = Logger('MiniMapBloc');

  MiniMapBloc() : super(MiniMapInitial()) {
    on<MiniMapLoadEvent>(_onMinimapLoadEvent);
    on<MiniMapUpdateStatus>(_onMiniMapUpdateStatus);
  }

  void _onMinimapLoadEvent(MiniMapLoadEvent event, Emitter<MiniMapState> emit) {
    if (event.listData.isNotEmpty) {
      emit(MiniMapLoaded(questionData: event.listData));
    }
  }

  void _onMiniMapUpdateStatus(
    MiniMapUpdateStatus event,
    Emitter<MiniMapState> emit,
  ) {
    final currState = state;
    if (currState is MiniMapLoaded) {
      var questionData = currState.questionData;
      questionData[questionData.indexWhere(
        (element) => element.questionId == event.questionId,
      )] = QuestionData(
        questionId: event.questionId,
        questionStatus:
            event.correct ? QuestionStatus.correct : QuestionStatus.incorrect,
      );
      _logger.info('QUESTION DATA: $questionData');
      emit(currState.copyWith(questionData: questionData));
    }
  }
}
