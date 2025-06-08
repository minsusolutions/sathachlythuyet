import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sathachlaixe/screens/splash/domain/splash_repository.dart';

part 'app_start_event.dart';
part 'app_start_state.dart';

class AppStartBloc extends Bloc<AppStartEvent, AppStartState> {
  AppStartBloc({required SplashRepository splashRepository})
    : _splashRepository = splashRepository,
      super(AppStartInitial()) {
    on<AppStarted>(_onStarted);
  }
  final SplashRepository _splashRepository;

  void _onStarted(AppStarted event, Emitter<AppStartState> emit) async {
    emit(AppStartInProgress());

    if (!_splashRepository.isDataSeeded()) {
      await _splashRepository.seedInitialData();
    }
    emit(AppStartedSuccess());
  }
}
