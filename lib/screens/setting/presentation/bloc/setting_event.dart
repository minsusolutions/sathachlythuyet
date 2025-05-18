part of 'setting_bloc.dart';

sealed class SettingEvent extends Equatable {
  const SettingEvent();

  @override
  List<Object> get props => [];
}

final class LoadSettingEvent extends SettingEvent {
  const LoadSettingEvent();
}

final class SelectLicienseEvent extends SettingEvent {
  final Liciense liciense;

  const SelectLicienseEvent({required this.liciense});
  @override
  List<Object> get props => [liciense];
}

final class CloseSettingEvent extends SettingEvent {
  const CloseSettingEvent();
}
