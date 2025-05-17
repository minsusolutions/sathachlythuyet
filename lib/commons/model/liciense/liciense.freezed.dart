// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'liciense.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Liciense {

 int get id; LicienseType get licienseType; int get examCode; String get image; NoOfQuestions get noOfQuestions; int get noOfExamSet; int get questionsPerExam; String get description;
/// Create a copy of Liciense
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LicienseCopyWith<Liciense> get copyWith => _$LicienseCopyWithImpl<Liciense>(this as Liciense, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Liciense&&(identical(other.id, id) || other.id == id)&&(identical(other.licienseType, licienseType) || other.licienseType == licienseType)&&(identical(other.examCode, examCode) || other.examCode == examCode)&&(identical(other.image, image) || other.image == image)&&(identical(other.noOfQuestions, noOfQuestions) || other.noOfQuestions == noOfQuestions)&&(identical(other.noOfExamSet, noOfExamSet) || other.noOfExamSet == noOfExamSet)&&(identical(other.questionsPerExam, questionsPerExam) || other.questionsPerExam == questionsPerExam)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,id,licienseType,examCode,image,noOfQuestions,noOfExamSet,questionsPerExam,description);

@override
String toString() {
  return 'Liciense(id: $id, licienseType: $licienseType, examCode: $examCode, image: $image, noOfQuestions: $noOfQuestions, noOfExamSet: $noOfExamSet, questionsPerExam: $questionsPerExam, description: $description)';
}


}

/// @nodoc
abstract mixin class $LicienseCopyWith<$Res>  {
  factory $LicienseCopyWith(Liciense value, $Res Function(Liciense) _then) = _$LicienseCopyWithImpl;
@useResult
$Res call({
 int id, LicienseType licienseType, int examCode, String image, NoOfQuestions noOfQuestions, int questionsPerExam, int noOfExamSet, String description
});




}
/// @nodoc
class _$LicienseCopyWithImpl<$Res>
    implements $LicienseCopyWith<$Res> {
  _$LicienseCopyWithImpl(this._self, this._then);

  final Liciense _self;
  final $Res Function(Liciense) _then;

/// Create a copy of Liciense
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? licienseType = null,Object? examCode = null,Object? image = null,Object? noOfQuestions = null,Object? questionsPerExam = null,Object? noOfExamSet = null,Object? description = null,}) {
  return _then(Liciense(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,licienseType: null == licienseType ? _self.licienseType : licienseType // ignore: cast_nullable_to_non_nullable
as LicienseType,examCode: null == examCode ? _self.examCode : examCode // ignore: cast_nullable_to_non_nullable
as int,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,noOfQuestions: null == noOfQuestions ? _self.noOfQuestions : noOfQuestions // ignore: cast_nullable_to_non_nullable
as NoOfQuestions,questionsPerExam: null == questionsPerExam ? _self.questionsPerExam : questionsPerExam // ignore: cast_nullable_to_non_nullable
as int,noOfExamSet: null == noOfExamSet ? _self.noOfExamSet : noOfExamSet // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


// dart format on
