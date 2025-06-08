part of 'app_start_bloc.dart';

sealed class AppStartState extends Equatable {
  const AppStartState();

  @override
  List<Object> get props => [];
}

final class AppStartInitial extends AppStartState {}

final class AppStartInProgress extends AppStartState {}

final class AppStartedSuccess extends AppStartState {}
