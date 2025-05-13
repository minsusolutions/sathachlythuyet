part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({required this.homeItems, required this.loadingResult});

  final List<HomeItem> homeItems;
  final DelayedResult<void> loadingResult;

  HomeState copyWith({
    List<HomeItem>? homeItems,
    DelayedResult<void>? loadingResult,
  }) {
    return HomeState(
      homeItems: homeItems ?? this.homeItems,
      loadingResult: loadingResult ?? this.loadingResult,
    );
  }

  @override
  List<Object> get props => [homeItems, loadingResult];
}
