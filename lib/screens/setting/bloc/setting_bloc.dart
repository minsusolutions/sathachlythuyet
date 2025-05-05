import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exam_repository/exam_repository.dart';
import 'package:logging/logging.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc({required LicienseRepository licienseRepository})
    : _licienseRepository = licienseRepository,
      super(SettingInitial()) {
    on<LoadAllLicienseRequest>(_loadAllLicienseRequest);
    on<LicienseSelected>(_onLicienseSelected);
  }

  final LicienseRepository _licienseRepository;

  final _log = Logger('SettingBlocs');

  _loadAllLicienseRequest(
    LoadAllLicienseRequest event,
    Emitter<SettingState> emit,
  ) async {
    await emit.forEach(
      _licienseRepository.getCurrLiciense(),
      onData: (currLiciense) {
        _log.info('Hanh + $currLiciense');
        return SettingLoaded(
          licienses: _licienseRepository.getLicienses(),
          currentLiciense: currLiciense,
        );
      },
      onError: (error, stackTrace) => SettingLoadError(),
    );
  }

  _onLicienseSelected(
    LicienseSelected event,
    Emitter<SettingState> emit,
  ) async {
    final selectedLiciense = event.liciense;
    await _licienseRepository.saveCurrentLiciense(selectedLiciense.id);
  }
}
