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

final class MiniMapUpdateCurrentIndex extends MiniMapEvent {
  final int currentIndex;

  const MiniMapUpdateCurrentIndex({required this.currentIndex});
}

final class MiniMapSelectCurrentIndexFromTab extends MiniMapEvent {
  final int currentIndex;

  const MiniMapSelectCurrentIndexFromTab({required this.currentIndex});
}
