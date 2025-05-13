part of 'home_bloc.dart';

sealed class HomeEvent {
  const HomeEvent();
}

final class LoadHomeEvent extends HomeEvent {
  const LoadHomeEvent();
}

final class ItemToggleHomeEvent extends HomeEvent {
  const ItemToggleHomeEvent();
}
