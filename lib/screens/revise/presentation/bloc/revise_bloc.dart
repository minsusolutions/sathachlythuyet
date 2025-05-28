import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sathachlaixe/screens/revise/domain/data/chapter.dart';
import 'package:sathachlaixe/screens/revise/domain/repository/revise_repository.dart';

part 'revise_event.dart';
part 'revise_state.dart';

class ReviseBloc extends Bloc<ReviseEvent, ReviseState> {
  final ReviseRepository _reviseRepository;

  ReviseBloc({required ReviseRepository reviseRepository})
    : _reviseRepository = reviseRepository,
      super(ReviseInitial()) {
    on<ReviseStarted>(_onReviseStarted);
  }

  void _onReviseStarted(ReviseStarted event, Emitter<ReviseState> emit) async {
    emit(
      ReviseLoaded(
        chapters: await _reviseRepository.getChapterListBaseOnLiciense(),
      ),
    );
  }
}
