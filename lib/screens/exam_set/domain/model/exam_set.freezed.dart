// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exam_set.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExamSet {

 int get licienseId; int get examCode; int get setId; List<int> get questionIds; int get numberOfFailed; int get numberOfSucceed;
/// Create a copy of ExamSet
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExamSetCopyWith<ExamSet> get copyWith => _$ExamSetCopyWithImpl<ExamSet>(this as ExamSet, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExamSet&&(identical(other.licienseId, licienseId) || other.licienseId == licienseId)&&(identical(other.examCode, examCode) || other.examCode == examCode)&&(identical(other.setId, setId) || other.setId == setId)&&const DeepCollectionEquality().equals(other.questionIds, questionIds)&&(identical(other.numberOfFailed, numberOfFailed) || other.numberOfFailed == numberOfFailed)&&(identical(other.numberOfSucceed, numberOfSucceed) || other.numberOfSucceed == numberOfSucceed));
}


@override
int get hashCode => Object.hash(runtimeType,licienseId,examCode,setId,const DeepCollectionEquality().hash(questionIds),numberOfFailed,numberOfSucceed);

@override
String toString() {
  return 'ExamSet(licienseId: $licienseId, examCode: $examCode, setId: $setId, questionIds: $questionIds, numberOfFailed: $numberOfFailed, numberOfSucceed: $numberOfSucceed)';
}


}

/// @nodoc
abstract mixin class $ExamSetCopyWith<$Res>  {
  factory $ExamSetCopyWith(ExamSet value, $Res Function(ExamSet) _then) = _$ExamSetCopyWithImpl;
@useResult
$Res call({
 int licienseId, int examCode, int setId, List<int> questionIds, int numberOfFailed, int numberOfSucceed
});




}
/// @nodoc
class _$ExamSetCopyWithImpl<$Res>
    implements $ExamSetCopyWith<$Res> {
  _$ExamSetCopyWithImpl(this._self, this._then);

  final ExamSet _self;
  final $Res Function(ExamSet) _then;

/// Create a copy of ExamSet
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? licienseId = null,Object? examCode = null,Object? setId = null,Object? questionIds = null,Object? numberOfFailed = null,Object? numberOfSucceed = null,}) {
  return _then(ExamSet(
licienseId: null == licienseId ? _self.licienseId : licienseId // ignore: cast_nullable_to_non_nullable
as int,examCode: null == examCode ? _self.examCode : examCode // ignore: cast_nullable_to_non_nullable
as int,setId: null == setId ? _self.setId : setId // ignore: cast_nullable_to_non_nullable
as int,questionIds: null == questionIds ? _self.questionIds : questionIds // ignore: cast_nullable_to_non_nullable
as List<int>,numberOfFailed: null == numberOfFailed ? _self.numberOfFailed : numberOfFailed // ignore: cast_nullable_to_non_nullable
as int,numberOfSucceed: null == numberOfSucceed ? _self.numberOfSucceed : numberOfSucceed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


// dart format on
