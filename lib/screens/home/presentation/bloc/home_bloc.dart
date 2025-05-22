import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logging/logging.dart';
import 'package:sathachlaixe/commons/model/delayed_result.dart';
import 'package:sathachlaixe/commons/model/liciense/liciense.dart';
import 'package:sathachlaixe/commons/model/liciense/licienses_data.dart';
import 'package:sathachlaixe/commons/model/exam_info/exam_info.dart';
import 'package:sathachlaixe/screens/home/domain/model/home_item.dart';
import 'package:sathachlaixe/screens/home/domain/repository/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _logger = Logger('HomeBloc');

  HomeBloc({required HomeRepository homeRepository})
    : _homeRepository = homeRepository,
      super(
        HomeState(
          homeItems: [],
          loadingResult: DelayedResult.idle(),
          currentLiciense: LiciensesData.licienses.first,
          examInfo: null,
        ),
      ) {
    on<LoadHomeEvent>(_loadHome);
    on<ItemToggleHomeEvent>(_itemToggle);
  }

  final HomeRepository _homeRepository;

  void _loadHome(LoadHomeEvent event, Emitter<HomeState> emit) async {
    _logger.info('_loadHome called');
    // emit(state.copyWith(loadingResult: const DelayedResult.inProgress()));
    emit(
      state.copyWith(
        homeItems: await _homeRepository.listHomeItems,
        currentLiciense: await _homeRepository.currentLiciense,
      ),
    );

    await Future.wait([
      _homeRepository.loadExamSetFromCsv(),
      _homeRepository.loadQuestionsFromCsv(),
      _homeRepository.generateExamInfoByLicienseAndExamCode(),
    ]);

    // _homeRepository.loadExamSetFromCsv();
    // _homeRepository.loadQuestionsFromCsv();
    // emit(state.copyWith(loadingResult: const DelayedResult.idle()));
  }

  void _itemToggle(ItemToggleHomeEvent event, Emitter<HomeState> emit) {
    var homeItem = event.homeItem;
    if (homeItem.jobCode == 0) {}
  }
}
