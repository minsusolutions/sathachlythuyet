part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  HomeLoaded({
    required this.homeItems,
    required this.currentLiciense,
    this.examInfo,
    required shouldGoToOtherScreen,
  });

  final List<HomeItem> homeItems;
  final Liciense currentLiciense;
  final ExamInfo? examInfo;
  final bool shouldGoToOtherScreen = false;

  HomeState copyWith({
    List<HomeItem>? homeItems,
    DelayedResult<void>? loadingResult,
    Liciense? currentLiciense,
    ExamInfo? examInfo,
    bool? shouldGoToOtherScreen,
  }) {
    return HomeLoaded(
      homeItems: homeItems ?? this.homeItems,
      currentLiciense: currentLiciense ?? this.currentLiciense,
      examInfo: examInfo ?? this.examInfo,
      shouldGoToOtherScreen:
          shouldGoToOtherScreen ?? this.shouldGoToOtherScreen,
    );
  }

  @override
  List<Object> get props => [homeItems, currentLiciense];
}
