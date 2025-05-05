import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exam_repository/exam_repository.dart'
    show Liciense, LicienseRepository;
import 'package:sathachlaixe/screens/home/model/home_item.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required LicienseRepository licienseRepository})
    : _licienseRepository = licienseRepository,
      super(HomeState(status: HomeViewStatus.initial)) {
    on<HomeSubscriptionReqeusted>(_onHomeSubcriptionRequested);
    on<HomeRandomExamToggled>(_onHomeRandomExamToggled);
  }

  final LicienseRepository _licienseRepository;

  void _onHomeSubcriptionRequested(
    HomeSubscriptionReqeusted event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith());
  }

  void _onHomeRandomExamToggled(
    HomeRandomExamToggled event,
    Emitter<HomeState> emit,
  ) {}
}
