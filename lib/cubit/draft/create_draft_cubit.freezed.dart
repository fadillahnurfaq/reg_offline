// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_draft_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateDraftState {

 ValidatorResult get phoneNumberValidation; ValidatorResult get nikValidation; File? get primaryIndentityPhoto; File? get secondaryIndentityPhoto; DateTime? get dateOfBirth; String? get gender; String? get status; String? get occupation; String? get province; String? get city; String? get district; String? get subDistrict; bool get isSubmitting; String? get errorMessage; bool? get isSuccess;
/// Create a copy of CreateDraftState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateDraftStateCopyWith<CreateDraftState> get copyWith => _$CreateDraftStateCopyWithImpl<CreateDraftState>(this as CreateDraftState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateDraftState&&(identical(other.phoneNumberValidation, phoneNumberValidation) || other.phoneNumberValidation == phoneNumberValidation)&&(identical(other.nikValidation, nikValidation) || other.nikValidation == nikValidation)&&(identical(other.primaryIndentityPhoto, primaryIndentityPhoto) || other.primaryIndentityPhoto == primaryIndentityPhoto)&&(identical(other.secondaryIndentityPhoto, secondaryIndentityPhoto) || other.secondaryIndentityPhoto == secondaryIndentityPhoto)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.status, status) || other.status == status)&&(identical(other.occupation, occupation) || other.occupation == occupation)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.district, district) || other.district == district)&&(identical(other.subDistrict, subDistrict) || other.subDistrict == subDistrict)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,phoneNumberValidation,nikValidation,primaryIndentityPhoto,secondaryIndentityPhoto,dateOfBirth,gender,status,occupation,province,city,district,subDistrict,isSubmitting,errorMessage,isSuccess);

@override
String toString() {
  return 'CreateDraftState(phoneNumberValidation: $phoneNumberValidation, nikValidation: $nikValidation, primaryIndentityPhoto: $primaryIndentityPhoto, secondaryIndentityPhoto: $secondaryIndentityPhoto, dateOfBirth: $dateOfBirth, gender: $gender, status: $status, occupation: $occupation, province: $province, city: $city, district: $district, subDistrict: $subDistrict, isSubmitting: $isSubmitting, errorMessage: $errorMessage, isSuccess: $isSuccess)';
}


}

/// @nodoc
abstract mixin class $CreateDraftStateCopyWith<$Res>  {
  factory $CreateDraftStateCopyWith(CreateDraftState value, $Res Function(CreateDraftState) _then) = _$CreateDraftStateCopyWithImpl;
@useResult
$Res call({
 ValidatorResult phoneNumberValidation, ValidatorResult nikValidation, File? primaryIndentityPhoto, File? secondaryIndentityPhoto, DateTime? dateOfBirth, String? gender, String? status, String? occupation, String? province, String? city, String? district, String? subDistrict, bool isSubmitting, String? errorMessage, bool? isSuccess
});




}
/// @nodoc
class _$CreateDraftStateCopyWithImpl<$Res>
    implements $CreateDraftStateCopyWith<$Res> {
  _$CreateDraftStateCopyWithImpl(this._self, this._then);

  final CreateDraftState _self;
  final $Res Function(CreateDraftState) _then;

/// Create a copy of CreateDraftState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? phoneNumberValidation = null,Object? nikValidation = null,Object? primaryIndentityPhoto = freezed,Object? secondaryIndentityPhoto = freezed,Object? dateOfBirth = freezed,Object? gender = freezed,Object? status = freezed,Object? occupation = freezed,Object? province = freezed,Object? city = freezed,Object? district = freezed,Object? subDistrict = freezed,Object? isSubmitting = null,Object? errorMessage = freezed,Object? isSuccess = freezed,}) {
  return _then(_self.copyWith(
phoneNumberValidation: null == phoneNumberValidation ? _self.phoneNumberValidation : phoneNumberValidation // ignore: cast_nullable_to_non_nullable
as ValidatorResult,nikValidation: null == nikValidation ? _self.nikValidation : nikValidation // ignore: cast_nullable_to_non_nullable
as ValidatorResult,primaryIndentityPhoto: freezed == primaryIndentityPhoto ? _self.primaryIndentityPhoto : primaryIndentityPhoto // ignore: cast_nullable_to_non_nullable
as File?,secondaryIndentityPhoto: freezed == secondaryIndentityPhoto ? _self.secondaryIndentityPhoto : secondaryIndentityPhoto // ignore: cast_nullable_to_non_nullable
as File?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,occupation: freezed == occupation ? _self.occupation : occupation // ignore: cast_nullable_to_non_nullable
as String?,province: freezed == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,subDistrict: freezed == subDistrict ? _self.subDistrict : subDistrict // ignore: cast_nullable_to_non_nullable
as String?,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isSuccess: freezed == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateDraftState].
extension CreateDraftStatePatterns on CreateDraftState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateDraftState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateDraftState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateDraftState value)  $default,){
final _that = this;
switch (_that) {
case _CreateDraftState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateDraftState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateDraftState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ValidatorResult phoneNumberValidation,  ValidatorResult nikValidation,  File? primaryIndentityPhoto,  File? secondaryIndentityPhoto,  DateTime? dateOfBirth,  String? gender,  String? status,  String? occupation,  String? province,  String? city,  String? district,  String? subDistrict,  bool isSubmitting,  String? errorMessage,  bool? isSuccess)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateDraftState() when $default != null:
return $default(_that.phoneNumberValidation,_that.nikValidation,_that.primaryIndentityPhoto,_that.secondaryIndentityPhoto,_that.dateOfBirth,_that.gender,_that.status,_that.occupation,_that.province,_that.city,_that.district,_that.subDistrict,_that.isSubmitting,_that.errorMessage,_that.isSuccess);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ValidatorResult phoneNumberValidation,  ValidatorResult nikValidation,  File? primaryIndentityPhoto,  File? secondaryIndentityPhoto,  DateTime? dateOfBirth,  String? gender,  String? status,  String? occupation,  String? province,  String? city,  String? district,  String? subDistrict,  bool isSubmitting,  String? errorMessage,  bool? isSuccess)  $default,) {final _that = this;
switch (_that) {
case _CreateDraftState():
return $default(_that.phoneNumberValidation,_that.nikValidation,_that.primaryIndentityPhoto,_that.secondaryIndentityPhoto,_that.dateOfBirth,_that.gender,_that.status,_that.occupation,_that.province,_that.city,_that.district,_that.subDistrict,_that.isSubmitting,_that.errorMessage,_that.isSuccess);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ValidatorResult phoneNumberValidation,  ValidatorResult nikValidation,  File? primaryIndentityPhoto,  File? secondaryIndentityPhoto,  DateTime? dateOfBirth,  String? gender,  String? status,  String? occupation,  String? province,  String? city,  String? district,  String? subDistrict,  bool isSubmitting,  String? errorMessage,  bool? isSuccess)?  $default,) {final _that = this;
switch (_that) {
case _CreateDraftState() when $default != null:
return $default(_that.phoneNumberValidation,_that.nikValidation,_that.primaryIndentityPhoto,_that.secondaryIndentityPhoto,_that.dateOfBirth,_that.gender,_that.status,_that.occupation,_that.province,_that.city,_that.district,_that.subDistrict,_that.isSubmitting,_that.errorMessage,_that.isSuccess);case _:
  return null;

}
}

}

/// @nodoc


class _CreateDraftState implements CreateDraftState {
  const _CreateDraftState({required this.phoneNumberValidation, required this.nikValidation, this.primaryIndentityPhoto, this.secondaryIndentityPhoto, this.dateOfBirth, this.gender, this.status, this.occupation, this.province, this.city, this.district, this.subDistrict, required this.isSubmitting, this.errorMessage, this.isSuccess});
  

@override final  ValidatorResult phoneNumberValidation;
@override final  ValidatorResult nikValidation;
@override final  File? primaryIndentityPhoto;
@override final  File? secondaryIndentityPhoto;
@override final  DateTime? dateOfBirth;
@override final  String? gender;
@override final  String? status;
@override final  String? occupation;
@override final  String? province;
@override final  String? city;
@override final  String? district;
@override final  String? subDistrict;
@override final  bool isSubmitting;
@override final  String? errorMessage;
@override final  bool? isSuccess;

/// Create a copy of CreateDraftState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateDraftStateCopyWith<_CreateDraftState> get copyWith => __$CreateDraftStateCopyWithImpl<_CreateDraftState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateDraftState&&(identical(other.phoneNumberValidation, phoneNumberValidation) || other.phoneNumberValidation == phoneNumberValidation)&&(identical(other.nikValidation, nikValidation) || other.nikValidation == nikValidation)&&(identical(other.primaryIndentityPhoto, primaryIndentityPhoto) || other.primaryIndentityPhoto == primaryIndentityPhoto)&&(identical(other.secondaryIndentityPhoto, secondaryIndentityPhoto) || other.secondaryIndentityPhoto == secondaryIndentityPhoto)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.status, status) || other.status == status)&&(identical(other.occupation, occupation) || other.occupation == occupation)&&(identical(other.province, province) || other.province == province)&&(identical(other.city, city) || other.city == city)&&(identical(other.district, district) || other.district == district)&&(identical(other.subDistrict, subDistrict) || other.subDistrict == subDistrict)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,phoneNumberValidation,nikValidation,primaryIndentityPhoto,secondaryIndentityPhoto,dateOfBirth,gender,status,occupation,province,city,district,subDistrict,isSubmitting,errorMessage,isSuccess);

@override
String toString() {
  return 'CreateDraftState(phoneNumberValidation: $phoneNumberValidation, nikValidation: $nikValidation, primaryIndentityPhoto: $primaryIndentityPhoto, secondaryIndentityPhoto: $secondaryIndentityPhoto, dateOfBirth: $dateOfBirth, gender: $gender, status: $status, occupation: $occupation, province: $province, city: $city, district: $district, subDistrict: $subDistrict, isSubmitting: $isSubmitting, errorMessage: $errorMessage, isSuccess: $isSuccess)';
}


}

/// @nodoc
abstract mixin class _$CreateDraftStateCopyWith<$Res> implements $CreateDraftStateCopyWith<$Res> {
  factory _$CreateDraftStateCopyWith(_CreateDraftState value, $Res Function(_CreateDraftState) _then) = __$CreateDraftStateCopyWithImpl;
@override @useResult
$Res call({
 ValidatorResult phoneNumberValidation, ValidatorResult nikValidation, File? primaryIndentityPhoto, File? secondaryIndentityPhoto, DateTime? dateOfBirth, String? gender, String? status, String? occupation, String? province, String? city, String? district, String? subDistrict, bool isSubmitting, String? errorMessage, bool? isSuccess
});




}
/// @nodoc
class __$CreateDraftStateCopyWithImpl<$Res>
    implements _$CreateDraftStateCopyWith<$Res> {
  __$CreateDraftStateCopyWithImpl(this._self, this._then);

  final _CreateDraftState _self;
  final $Res Function(_CreateDraftState) _then;

/// Create a copy of CreateDraftState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? phoneNumberValidation = null,Object? nikValidation = null,Object? primaryIndentityPhoto = freezed,Object? secondaryIndentityPhoto = freezed,Object? dateOfBirth = freezed,Object? gender = freezed,Object? status = freezed,Object? occupation = freezed,Object? province = freezed,Object? city = freezed,Object? district = freezed,Object? subDistrict = freezed,Object? isSubmitting = null,Object? errorMessage = freezed,Object? isSuccess = freezed,}) {
  return _then(_CreateDraftState(
phoneNumberValidation: null == phoneNumberValidation ? _self.phoneNumberValidation : phoneNumberValidation // ignore: cast_nullable_to_non_nullable
as ValidatorResult,nikValidation: null == nikValidation ? _self.nikValidation : nikValidation // ignore: cast_nullable_to_non_nullable
as ValidatorResult,primaryIndentityPhoto: freezed == primaryIndentityPhoto ? _self.primaryIndentityPhoto : primaryIndentityPhoto // ignore: cast_nullable_to_non_nullable
as File?,secondaryIndentityPhoto: freezed == secondaryIndentityPhoto ? _self.secondaryIndentityPhoto : secondaryIndentityPhoto // ignore: cast_nullable_to_non_nullable
as File?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,occupation: freezed == occupation ? _self.occupation : occupation // ignore: cast_nullable_to_non_nullable
as String?,province: freezed == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,subDistrict: freezed == subDistrict ? _self.subDistrict : subDistrict // ignore: cast_nullable_to_non_nullable
as String?,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isSuccess: freezed == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
