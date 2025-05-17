part of 'setting_bloc.dart';

class SettingState extends Equatable {
  final List<Liciense> licienses;
  final Liciense currentLiciense;
  final DelayedResult<void> loadingResult;

  const SettingState({
    required this.licienses,
    required this.currentLiciense,
    required this.loadingResult,
  });

  SettingState copyWith({
    List<Liciense>? licienses,
    Liciense? currentLiciense,
    DelayedResult<void>? loadingResult,
  }) {
    return SettingState(
      licienses: licienses ?? this.licienses,
      currentLiciense: currentLiciense ?? this.currentLiciense,
      loadingResult: loadingResult ?? this.loadingResult,
    );
  }

  @override
  List<Object?> get props => [licienses, currentLiciense, loadingResult];
}
