part of 'setting_bloc.dart';

sealed class SettingState extends Equatable {
  const SettingState();

  @override
  List<Object> get props => [];
}

final class SettingInitial extends SettingState {}

final class SettingLoaded extends SettingState {
  final List<Liciense> licienses;
  final Liciense currentLiciense;

  const SettingLoaded({required this.licienses, required this.currentLiciense});
  @override
  List<Object> get props => [licienses, currentLiciense];
}

final class SettingLoadError extends SettingState {}
