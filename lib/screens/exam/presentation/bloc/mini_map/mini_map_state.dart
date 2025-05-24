part of 'mini_map_bloc.dart';

sealed class MiniMapState extends Equatable {
  const MiniMapState();

  @override
  List<Object> get props => [];
}

final class MiniMapInitial extends MiniMapState {}

final class MiniMapLoaded extends MiniMapState {
  const MiniMapLoaded({required this.questionData});

  final List<QuestionData> questionData;

  MiniMapLoaded copyWith({List<QuestionData>? questionData}) {
    return MiniMapLoaded(questionData: questionData ?? this.questionData);
  }

  @override
  List<Object> get props => [questionData];
}
