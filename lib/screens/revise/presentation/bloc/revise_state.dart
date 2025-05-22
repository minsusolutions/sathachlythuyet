part of 'revise_bloc.dart';

sealed class ReviseState extends Equatable {
  const ReviseState();
  
  @override
  List<Object> get props => [];
}

final class ReviseInitial extends ReviseState {}
