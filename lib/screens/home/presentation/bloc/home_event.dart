part of 'home_bloc.dart';

sealed class HomeEvent {
  const HomeEvent();
}

final class HomeSubscriptionReqeusted extends HomeEvent {
  HomeSubscriptionReqeusted();
}

final class HomeRandomExamToggled extends HomeEvent {
  final Liciense currentLiciense;
  HomeRandomExamToggled({required this.currentLiciense});
}
