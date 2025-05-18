part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    required this.homeItems,
    required this.loadingResult,
    required this.currentLiciense,
  });

  final List<HomeItem> homeItems;
  final DelayedResult<void> loadingResult;
  final Liciense currentLiciense;

  HomeState copyWith({
    List<HomeItem>? homeItems,
    DelayedResult<void>? loadingResult,
    Liciense? currentLiciense,
  }) {
    return HomeState(
      homeItems: homeItems ?? this.homeItems,
      loadingResult: loadingResult ?? this.loadingResult,
      currentLiciense: currentLiciense ?? this.currentLiciense,
    );
  }

  @override
  List<Object> get props => [homeItems, loadingResult, currentLiciense];
}
