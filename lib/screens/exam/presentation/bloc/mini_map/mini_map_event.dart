part of 'mini_map_bloc.dart';

sealed class MiniMapEvent extends Equatable {
  const MiniMapEvent();

  @override
  List<Object> get props => [];
}

final class MiniMapLoadEvent extends MiniMapEvent {
  final List<QuestionData> listData;
  const MiniMapLoadEvent({required this.listData});
}

final class MiniMapUpdateStatus extends MiniMapEvent {
  final bool correct;
  final int questionId;
  const MiniMapUpdateStatus({required this.questionId, required this.correct});
}
