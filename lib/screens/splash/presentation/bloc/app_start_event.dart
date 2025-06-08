part of 'app_start_bloc.dart';

sealed class AppStartEvent extends Equatable {
  const AppStartEvent();

  @override
  List<Object> get props => [];
}

final class AppStarted extends AppStartEvent {}
