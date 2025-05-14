import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logging/logging.dart';
import 'package:sathachlaixe/commons/model/delayed_result.dart';
import 'package:sathachlaixe/screens/setting/domain/model/setting_liciense.dart';
import 'package:sathachlaixe/screens/setting/domain/repository/setting_repository.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc({required SettingRepository settingRepository})
    : _settingRepository = settingRepository,
      super(
        const SettingState(
          licienses: [],
          currentLiciense: SettingLiciense(
            title: '',
            description: '',
            image: '',
          ),
          loadingResult: DelayedResult.idle(),
        ),
      ) {
    on<LoadSettingEvent>(_loadSetting);
    on<SelectLicienseEvent>(_onLicienseSelected);
  }

  final SettingRepository _settingRepository;

  final _log = Logger('SettingBlocs');

  _loadSetting(LoadSettingEvent event, Emitter<SettingState> emit) async {
    _log.info('Load Setting');
    var listLicienses = await _settingRepository.listLicienses;
    var currentLiciense = await _settingRepository.currentLiciense;
    emit(
      state.copyWith(
        licienses: listLicienses,
        currentLiciense: currentLiciense,
      ),
    );
  }

  _onLicienseSelected(
    SelectLicienseEvent event,
    Emitter<SettingState> emit,
  ) async {
    final selectedLiciense = event.liciense;
    //await _licienseRepository.saveCurrentLiciense(selectedLiciense.id);
  }
}
