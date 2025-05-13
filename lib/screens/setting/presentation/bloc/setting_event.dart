part of 'setting_bloc.dart';

sealed class SettingEvent extends Equatable {
  const SettingEvent();

  @override
  List<Object> get props => [];
}

final class LoadSetingEvent extends SettingEvent {
  const LoadSetingEvent();
}

final class SelectLicienseEvent extends SettingEvent {
  final SettingLiciense liciense;

  const SelectLicienseEvent({required this.liciense});
  @override
  List<Object> get props => [liciense];
}
