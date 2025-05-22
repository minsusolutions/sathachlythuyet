import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'revise_event.dart';
part 'revise_state.dart';

class ReviseBloc extends Bloc<ReviseEvent, ReviseState> {
  ReviseBloc() : super(ReviseInitial()) {
    on<ReviseEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
