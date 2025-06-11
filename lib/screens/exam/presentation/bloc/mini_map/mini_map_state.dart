// part of 'mini_map_bloc.dart';

// enum LoadingStatus { loading, loaed }

// sealed class MiniMapState extends Equatable {
//   const MiniMapState();

//   @override
//   List<Object> get props => [];
// }

// final class MiniMapInitial extends MiniMapState {}

// final class MiniMapLoaded extends MiniMapState {
//   const MiniMapLoaded({
//     required this.questionData,
//     required this.loadingStatus,
//     required this.currentQuestion,
//     required this.updateTabControllerIndicator,
//   });

//   final List<QuestionData> questionData;
//   final LoadingStatus loadingStatus;
//   final int currentQuestion;
//   final bool updateTabControllerIndicator;

//   MiniMapLoaded copyWith({
//     List<QuestionData>? questionData,
//     LoadingStatus? loadingStatus,
//     int? currentQuestion,
//     bool? updateTabControllerIndicator,
//   }) {
//     return MiniMapLoaded(
//       questionData: questionData ?? this.questionData,
//       loadingStatus: loadingStatus ?? this.loadingStatus,
//       currentQuestion: currentQuestion ?? this.currentQuestion,
//       updateTabControllerIndicator:
//           updateTabControllerIndicator ?? this.updateTabControllerIndicator,
//     );
//   }

//   @override
//   List<Object> get props => [loadingStatus, questionData, currentQuestion];
// }
