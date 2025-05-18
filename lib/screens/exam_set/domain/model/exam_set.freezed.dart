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

 int get examSetID; int get examSetCode; int get examSetName; int get numberOfFailed; int get numberOFSuccedd; int get questionId;
/// Create a copy of ExamSet
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExamSetCopyWith<ExamSet> get copyWith => _$ExamSetCopyWithImpl<ExamSet>(this as ExamSet, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExamSet&&(identical(other.examSetID, examSetID) || other.examSetID == examSetID)&&(identical(other.examSetCode, examSetCode) || other.examSetCode == examSetCode)&&(identical(other.examSetName, examSetName) || other.examSetName == examSetName)&&(identical(other.numberOfFailed, numberOfFailed) || other.numberOfFailed == numberOfFailed)&&(identical(other.numberOFSuccedd, numberOFSuccedd) || other.numberOFSuccedd == numberOFSuccedd)&&(identical(other.questionId, questionId) || other.questionId == questionId));
}


@override
int get hashCode => Object.hash(runtimeType,examSetID,examSetCode,examSetName,numberOfFailed,numberOFSuccedd,questionId);

@override
String toString() {
  return 'ExamSet(examSetID: $examSetID, examSetCode: $examSetCode, examSetName: $examSetName, numberOfFailed: $numberOfFailed, numberOFSuccedd: $numberOFSuccedd, questionId: $questionId)';
}


}

/// @nodoc
abstract mixin class $ExamSetCopyWith<$Res>  {
  factory $ExamSetCopyWith(ExamSet value, $Res Function(ExamSet) _then) = _$ExamSetCopyWithImpl;
@useResult
$Res call({
 int examSetID, int examSetCode, int examSetName, int numberOfFailed, int numberOFSuccedd, int questionId
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
@pragma('vm:prefer-inline') @override $Res call({Object? examSetID = null,Object? examSetCode = null,Object? examSetName = null,Object? numberOfFailed = null,Object? numberOFSuccedd = null,Object? questionId = null,}) {
  return _then(ExamSet(
examSetID: null == examSetID ? _self.examSetID : examSetID // ignore: cast_nullable_to_non_nullable
as int,examSetCode: null == examSetCode ? _self.examSetCode : examSetCode // ignore: cast_nullable_to_non_nullable
as int,examSetName: null == examSetName ? _self.examSetName : examSetName // ignore: cast_nullable_to_non_nullable
as int,numberOfFailed: null == numberOfFailed ? _self.numberOfFailed : numberOfFailed // ignore: cast_nullable_to_non_nullable
as int,numberOFSuccedd: null == numberOFSuccedd ? _self.numberOFSuccedd : numberOFSuccedd // ignore: cast_nullable_to_non_nullable
as int,questionId: null == questionId ? _self.questionId : questionId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


// dart format on
