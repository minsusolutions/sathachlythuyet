import 'package:bloc/bloc.dart';
import 'package:sathachlaixe/commons/model/exam_info/exam_info.dart';
import 'package:sathachlaixe/screens/exam_result/domain/repository/exam_result_repository.dart';

part 'exam_result_event.dart';
part 'exam_result_state.dart';

class ExamResultBloc extends Bloc<ExamResultEvent, ExamResultState> {
  final ExamResultRepository _examResultRepository;

  ExamResultBloc(this._examResultRepository) : super(ExamResultLoading()) {
    on<LoadExamResultEvent>((event, emit) async {
      emit(ExamResultLoading());
      try {
        final examInfo = await _examResultRepository.getExamInfo(
          event.licenseId,
          event.examCode,
          examSetId: event.examSetId,
        );
        if (examInfo != null) {
          emit(ExamResultLoaded(examInfo));
        } else {
          emit(ExamResultError('Không tìm thấy thông tin bài thi.'));
        }
      } catch (e) {
        emit(ExamResultError('Lỗi khi tải thông tin bài thi: ${e.toString()}'));
      }
    });

    on<SaveExamResultEvent>((event, emit) async {
      emit(
        ExamResultLoading(),
      ); // Có thể phát ra trạng thái Loading khi đang lưu
      try {
        await _examResultRepository.saveExamInfo(event.examInfo);
        emit(
          ExamResultLoaded(event.examInfo),
        ); // Phát ra trạng thái Loaded sau khi lưu thành công
      } catch (e) {
        emit(ExamResultError('Lỗi khi lưu thông tin bài thi: ${e.toString()}'));
      }
    });
  }
}
