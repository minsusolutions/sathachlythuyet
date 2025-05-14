import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
part 'setting_liciense.freezed.dart';
part 'setting_liciense.g.dart';

@freezed
@JsonSerializable()
@HiveType(typeId: 0)
class SettingLiciense with _$SettingLiciense {
  const SettingLiciense({
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  @HiveField(0)
  final String title;

  @override
  @HiveField(1)
  final String description;

  @override
  @HiveField(2)
  final String image;

  factory SettingLiciense.fromJson(Map<String, Object> json) =>
      _$SettingLicienseFromJson(json);

  Map<String, Object?> toJson() => _$SettingLicienseToJson(this);
}
