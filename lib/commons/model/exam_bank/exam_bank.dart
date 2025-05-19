import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'exam_bank.freezed.dart';
part 'exam_bank.g.dart';

@freezed
@JsonSerializable()
class ExamBank with _$ExamBank {
  static const examSetBoxKey = '_examSetBoxKey';
  static const allExamSetKey = '_allExamSet';

  final int examSetID;
  final int examCode;
  final int questionId;

  const ExamBank({
    required this.examSetID,
    required this.examCode,
    required this.questionId,
  });

  factory ExamBank.fromJson(Map<String, dynamic> json) =>
      _$ExamBankFromJson(json);

  Map<String, dynamic> toJson() => _$ExamBankToJson(this);
}

class ExamBankAdapter extends TypeAdapter<ExamBank> {
  @override
  final typeId = 3;

  @override
  ExamBank read(BinaryReader reader) {
    return ExamBank(
      examCode: reader.read(),
      examSetID: reader.read(),
      questionId: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, ExamBank obj) {
    writer.write(obj.examSetID);
    writer.write(obj.examCode);
    writer.write(obj.questionId);
  }
}
