import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
part 'liciense.freezed.dart';

enum LicienseType { a1, a, b1, b, c1, c, d1, d2, d, be, c1e, ce, d1e, d2e, de }

enum VehicleType { motor, tricycle, sedan, truck, bus }

enum NoOfQuestions { q200, q450, q500, q600 }

@freezed
class Liciense with _$Liciense {
  final int id;
  final LicienseType licienseType;
  final int examCode;
  final String image;
  final NoOfQuestions noOfQuestions;
  final int noOfExamSet;
  final int questionsPerExam;
  final String description;

  const Liciense({
    required this.id,
    required this.licienseType,
    required this.examCode,
    required this.image,
    required this.noOfQuestions,
    required this.questionsPerExam,
    required this.noOfExamSet,
    required this.description,
  });
}

class LicienseAdapter extends TypeAdapter<Liciense> {
  @override
  final typeId = 0;

  @override
  Liciense read(BinaryReader reader) {
    return Liciense(
      id: reader.read(),
      licienseType: reader.read(),
      examCode: reader.read(),
      image: reader.read(),
      noOfQuestions: reader.read(),
      questionsPerExam: reader.read(),
      noOfExamSet: reader.read(),
      description: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Liciense obj) {
    writer.write(obj.id);
    writer.write(obj.licienseType);
    writer.write(obj.examCode);
    writer.write(obj.image);

    writer.write(obj.noOfQuestions);
    writer.write(obj.questionsPerExam);
    writer.write(obj.noOfExamSet);
    writer.write(obj.description);
  }
}
