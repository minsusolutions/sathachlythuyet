// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_liciense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingLiciense _$SettingLicienseFromJson(Map<String, dynamic> json) =>
    SettingLiciense(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$SettingLicienseToJson(SettingLiciense instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
    };
