// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exam_bank.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExamBank {

 int get examSetID; int get examCode; int get questionId;
/// Create a copy of ExamBank
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExamBankCopyWith<ExamBank> get copyWith => _$ExamBankCopyWithImpl<ExamBank>(this as ExamBank, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExamBank&&(identical(other.examSetID, examSetID) || other.examSetID == examSetID)&&(identical(other.examCode, examCode) || other.examCode == examCode)&&(identical(other.questionId, questionId) || other.questionId == questionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,examSetID,examCode,questionId);

@override
String toString() {
  return 'ExamBank(examSetID: $examSetID, examSetCode: $examCode, questionId: $questionId)';
}


}

/// @nodoc
abstract mixin class $ExamBankCopyWith<$Res>  {
  factory $ExamBankCopyWith(ExamBank value, $Res Function(ExamBank) _then) = _$ExamBankCopyWithImpl;
@useResult
$Res call({
 int examSetID, int examSetCode, int questionId
});




}
/// @nodoc
class _$ExamBankCopyWithImpl<$Res>
    implements $ExamBankCopyWith<$Res> {
  _$ExamBankCopyWithImpl(this._self, this._then);

  final ExamBank _self;
  final $Res Function(ExamBank) _then;

/// Create a copy of ExamBank
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? examSetID = null,Object? examSetCode = null,Object? questionId = null,}) {
  return _then(ExamBank(
examSetID: null == examSetID ? _self.examSetID : examSetID // ignore: cast_nullable_to_non_nullable
as int,examCode: null == examSetCode ? _self.examCode : examSetCode // ignore: cast_nullable_to_non_nullable
as int,questionId: null == questionId ? _self.questionId : questionId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


// dart format on
