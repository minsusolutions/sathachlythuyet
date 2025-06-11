// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:logging/logging.dart';
// import 'package:sathachlaixe/screens/exam/domain/model/question_data.dart';

// part 'mini_map_event.dart';
// part 'mini_map_state.dart';

// class MiniMapBloc extends Bloc<MiniMapEvent, MiniMapState> {
//   final _logger = Logger('MiniMapBloc');

//   MiniMapBloc() : super(MiniMapInitial()) {
//     on<MiniMapLoadEvent>(_onMinimapLoadEvent);
//     on<MiniMapUpdateStatus>(_onMiniMapUpdateStatus);
//     on<MiniMapUpdateCurrentIndex>(_onMinimapUpdateCurrentIndex);
//     on<MiniMapSelectCurrentIndexFromTab>(_onMinimapSelectCurrentIndexFromTab);
//   }

//   void _onMinimapLoadEvent(MiniMapLoadEvent event, Emitter<MiniMapState> emit) {
//     if (event.listData.isNotEmpty) {
//       emit(
//         MiniMapLoaded(
//           questionData: event.listData,
//           loadingStatus: LoadingStatus.loaed,
//           currentQuestion: 0,
//           updateTabControllerIndicator: false,
//         ),
//       );
//     }
//   }

//   void _onMiniMapUpdateStatus(
//     MiniMapUpdateStatus event,
//     Emitter<MiniMapState> emit,
//   ) {
//     final currState = state;
//     if (currState is MiniMapLoaded) {
//       emit(currState.copyWith(loadingStatus: LoadingStatus.loading));
//       var questionData = currState.questionData;

//       var currentIndex = questionData.indexWhere(
//         (element) => element.questionId == event.questionId,
//       );
//       questionData[currentIndex] = QuestionData(
//         questionId: event.questionId,
//         questionStatus:
//             event.correct ? QuestionStatus.correct : QuestionStatus.incorrect,
//       );
//       emit(
//         currState.copyWith(
//           questionData: questionData,
//           loadingStatus: LoadingStatus.loaed,
//         ),
//       );
//     }
//   }

//   void _onMinimapUpdateCurrentIndex(
//     MiniMapUpdateCurrentIndex event,
//     Emitter<MiniMapState> emit,
//   ) {
//     final currentState = state;
//     if (currentState is MiniMapLoaded) {

//       final questionData = [
//         for(final qData in currentState.questionData) {
//           if (qData.questionStatus != QuestionStatus.incorrect && qData.questionStatus != QuestionStatus.correct) {
//              qData.copyWith(questionId: qData.questionId, questionStatus: QuestionStatus.unanswer)
//           }
//         }
//       ].toList();
//       questionData[event.currentIndex] = questionData[event.currentIndex];
      

//       emit(
//         MiniMapLoaded(
//           questionData: currentState.questionData,
//           loadingStatus: currentState.loadingStatus,
//           currentQuestion: event.currentIndex,
//           updateTabControllerIndicator:
//               currentState.updateTabControllerIndicator,
//         ),
//       );
//     }
//   }

//   void _onMinimapSelectCurrentIndexFromTab(
//     MiniMapSelectCurrentIndexFromTab event,
//     Emitter<MiniMapState> emit,
//   ) {
//     final currentState = state;
//     if (currentState is MiniMapLoaded) {
//       emit(
//         MiniMapLoaded(
//           questionData: currentState.questionData,
//           loadingStatus: currentState.loadingStatus,
//           currentQuestion: event.currentIndex,
//           updateTabControllerIndicator:
//               !currentState.updateTabControllerIndicator,
//         ),
//       );
//     }
//   }
// }
