part of 'home_bloc.dart';

enum HomeViewStatus { initial, loading, completed }

class HomeState extends Equatable {
  HomeState({
    this.status = HomeViewStatus.initial,
    this.currentLiciense,
    this.incorrecQuestions,
    this.passPercent,
    this.daOn,
    this.homeItems,
  });

  final Liciense? currentLiciense;
  final HomeViewStatus status;
  final int? incorrecQuestions;
  final double? passPercent;
  final int? daOn;
  List<HomeItem>? homeItems = [];

  HomeState copyWith({
    HomeViewStatus? status,
    Liciense? currentLiciense,
    int? incorrecQuestions,
    double? passPercent,
    int? daOn,
    List<HomeItem>? homeItems,
  }) {
    return HomeState(
      status: status ?? this.status,
      currentLiciense: currentLiciense ?? this.currentLiciense,
      incorrecQuestions: incorrecQuestions ?? this.incorrecQuestions,
      passPercent: passPercent ?? this.passPercent,
      daOn: daOn ?? this.daOn,
      homeItems: HomeItem.getList(),
    );
  }

  @override
  List<Object> get props => [];
}
