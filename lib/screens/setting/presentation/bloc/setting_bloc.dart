import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logging/logging.dart';
import 'package:sathachlaixe/commons/model/delayed_result.dart';
import 'package:sathachlaixe/commons/model/liciense/liciense.dart';
import 'package:sathachlaixe/screens/setting/domain/repository/setting_repository.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc({required SettingRepository settingRepository})
    : _settingRepository = settingRepository,
      super(
        const SettingState(
          licienses: [],
          currentLiciense: Liciense(
            id: -1,
            licienseType: LicienseType.a,
            examCode: -1,
            image: '',
            noOfQuestions: NoOfQuestions.q200,
            questionsPerExam: -1,
            noOfExamSet: -1,
            description: '-',
            minPass: 0,
            duration: 0,
          ),
          loadingResult: DelayedResult.inProgress(),
        ),
      ) {
    on<LoadSettingEvent>(_loadSetting);
    on<SelectLicienseEvent>(_onLicienseSelected);
    on<CloseSettingEvent>(_onCloseSetting);
  }

  final SettingRepository _settingRepository;

  final _log = Logger('SettingBlocs');

  _loadSetting(LoadSettingEvent event, Emitter<SettingState> emit) async {
    emit(state.copyWith(loadingResult: DelayedResult.inProgress()));

    _log.info('Load Setting');
    var listLicienses = await _settingRepository.listLicienses;
    var currentLiciense = await _settingRepository.currentLiciense;
    _log.info(' load current liciense: $currentLiciense');

    emit(
      state.copyWith(
        licienses: listLicienses,
        currentLiciense: currentLiciense,
        loadingResult: DelayedResult.idle(),
      ),
    );
  }

  _onLicienseSelected(
    SelectLicienseEvent event,
    Emitter<SettingState> emit,
  ) async {
    await _settingRepository.saveCurrentLiciense(event.liciense);
    emit(
      state.copyWith(
        currentLiciense: event.liciense,
        loadingResult: DelayedResult.idle(),
      ),
    );
  }

  _onCloseSetting(CloseSettingEvent event, Emitter<SettingState> emit) async {
    await _settingRepository.onClose();
  }
}
