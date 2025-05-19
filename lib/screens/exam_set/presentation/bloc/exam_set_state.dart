part of 'exam_set_bloc.dart';

class ExamSetState extends Equatable {
  const ExamSetState({required this.listExamSet});

  final List<ExamSet> listExamSet;

  @override
  List<Object?> get props => [listExamSet];

  ExamSetState copyWith({List<ExamSet>? listExamSet}) {
    return ExamSetState(listExamSet: listExamSet ?? this.listExamSet);
  }
}
