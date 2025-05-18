import 'package:freezed_annotation/freezed_annotation.dart';
part 'setting_liciense.freezed.dart';
part 'setting_liciense.g.dart';

@freezed
@JsonSerializable()
class SettingLiciense with _$SettingLiciense {
  static const settingBoxKey = '_settingBoxKey';
  static const currentLicienseKey = '_currentLicienseKey';

  const SettingLiciense({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  final int id;

  @override
  final String title;

  @override
  final String description;

  @override
  final String image;

  factory SettingLiciense.fromJson(Map<String, Object> json) =>
      _$SettingLicienseFromJson(json);

  Map<String, Object?> toJson() => _$SettingLicienseToJson(this);
}
