part of 'draw_bloc.dart';

enum LoadingStatus { loading, loaed }

sealed class DrawState extends Equatable {
  const DrawState();

  @override
  List<Object> get props => [];
}

final class DrawInitial extends DrawState {}

final class DrawLoaded extends DrawState {
  const DrawLoaded({
    required this.questionData,
    required this.loadingStatus,
    required this.currentQuestion,
  });

  final List<QuestionData> questionData;
  final LoadingStatus loadingStatus;
  final int currentQuestion;

  DrawLoaded copyWith({
    List<QuestionData>? questionData,
    LoadingStatus? loadingStatus,
    int? currentQuestion,
  }) {
    return DrawLoaded(
      questionData: questionData ?? this.questionData,
      loadingStatus: loadingStatus ?? this.loadingStatus,
      currentQuestion: currentQuestion ?? this.currentQuestion,
    );
  }

  @override
  List<Object> get props => [loadingStatus, questionData, currentQuestion];
}
