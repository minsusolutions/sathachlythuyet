import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logging/logging.dart';
import 'package:sathachlaixe/commons/model/delayed_result.dart';
import 'package:sathachlaixe/screens/home/domain/model/home_item.dart';
import 'package:sathachlaixe/screens/home/domain/repository/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _logger = Logger('HomeBloc');

  HomeBloc({required HomeRepository homeRepository})
    : _homeRepository = homeRepository,
      super(HomeState(homeItems: [], loadingResult: DelayedResult.idle())) {
    on<LoadHomeEvent>(_loadHome);
    on<ItemToggleHomeEvent>(_itemToggle);
  }

  final HomeRepository _homeRepository;

  void _loadHome(LoadHomeEvent event, Emitter<HomeState> emit) async {
    _logger.info('_loadHome called');
    // emit(state.copyWith(loadingResult: const DelayedResult.inProgress()));
    emit(state.copyWith(homeItems: await _homeRepository.listHomeItems));
    // emit(state.copyWith(loadingResult: const DelayedResult.idle()));
  }

  void _itemToggle(ItemToggleHomeEvent event, Emitter<HomeState> emit) {}
}
