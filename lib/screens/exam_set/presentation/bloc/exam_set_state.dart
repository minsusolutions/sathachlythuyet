part of 'exam_set_bloc.dart';

class ExamSetState extends Equatable {
  const ExamSetState({required this.listExamInfo});

  final List<ExamInfo?> listExamInfo;

  @override
  List<Object?> get props => [listExamInfo];

  ExamSetState copyWith({List<ExamInfo?>? listExamInfo}) {
    return ExamSetState(listExamInfo: listExamInfo ?? this.listExamInfo);
  }
}
