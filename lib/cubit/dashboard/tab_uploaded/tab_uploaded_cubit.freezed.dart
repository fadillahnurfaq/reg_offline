// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tab_uploaded_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TabUploadedState {

 Result<List<MemberModel>> get resultMembers;
/// Create a copy of TabUploadedState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TabUploadedStateCopyWith<TabUploadedState> get copyWith => _$TabUploadedStateCopyWithImpl<TabUploadedState>(this as TabUploadedState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TabUploadedState&&(identical(other.resultMembers, resultMembers) || other.resultMembers == resultMembers));
}


@override
int get hashCode => Object.hash(runtimeType,resultMembers);

@override
String toString() {
  return 'TabUploadedState(resultMembers: $resultMembers)';
}


}

/// @nodoc
abstract mixin class $TabUploadedStateCopyWith<$Res>  {
  factory $TabUploadedStateCopyWith(TabUploadedState value, $Res Function(TabUploadedState) _then) = _$TabUploadedStateCopyWithImpl;
@useResult
$Res call({
 Result<List<MemberModel>> resultMembers
});




}
/// @nodoc
class _$TabUploadedStateCopyWithImpl<$Res>
    implements $TabUploadedStateCopyWith<$Res> {
  _$TabUploadedStateCopyWithImpl(this._self, this._then);

  final TabUploadedState _self;
  final $Res Function(TabUploadedState) _then;

/// Create a copy of TabUploadedState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? resultMembers = null,}) {
  return _then(_self.copyWith(
resultMembers: null == resultMembers ? _self.resultMembers : resultMembers // ignore: cast_nullable_to_non_nullable
as Result<List<MemberModel>>,
  ));
}

}


/// Adds pattern-matching-related methods to [TabUploadedState].
extension TabUploadedStatePatterns on TabUploadedState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TabUploadedState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TabUploadedState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TabUploadedState value)  $default,){
final _that = this;
switch (_that) {
case _TabUploadedState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TabUploadedState value)?  $default,){
final _that = this;
switch (_that) {
case _TabUploadedState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Result<List<MemberModel>> resultMembers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TabUploadedState() when $default != null:
return $default(_that.resultMembers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Result<List<MemberModel>> resultMembers)  $default,) {final _that = this;
switch (_that) {
case _TabUploadedState():
return $default(_that.resultMembers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Result<List<MemberModel>> resultMembers)?  $default,) {final _that = this;
switch (_that) {
case _TabUploadedState() when $default != null:
return $default(_that.resultMembers);case _:
  return null;

}
}

}

/// @nodoc


class _TabUploadedState implements TabUploadedState {
  const _TabUploadedState({required this.resultMembers});
  

@override final  Result<List<MemberModel>> resultMembers;

/// Create a copy of TabUploadedState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TabUploadedStateCopyWith<_TabUploadedState> get copyWith => __$TabUploadedStateCopyWithImpl<_TabUploadedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TabUploadedState&&(identical(other.resultMembers, resultMembers) || other.resultMembers == resultMembers));
}


@override
int get hashCode => Object.hash(runtimeType,resultMembers);

@override
String toString() {
  return 'TabUploadedState(resultMembers: $resultMembers)';
}


}

/// @nodoc
abstract mixin class _$TabUploadedStateCopyWith<$Res> implements $TabUploadedStateCopyWith<$Res> {
  factory _$TabUploadedStateCopyWith(_TabUploadedState value, $Res Function(_TabUploadedState) _then) = __$TabUploadedStateCopyWithImpl;
@override @useResult
$Res call({
 Result<List<MemberModel>> resultMembers
});




}
/// @nodoc
class __$TabUploadedStateCopyWithImpl<$Res>
    implements _$TabUploadedStateCopyWith<$Res> {
  __$TabUploadedStateCopyWithImpl(this._self, this._then);

  final _TabUploadedState _self;
  final $Res Function(_TabUploadedState) _then;

/// Create a copy of TabUploadedState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? resultMembers = null,}) {
  return _then(_TabUploadedState(
resultMembers: null == resultMembers ? _self.resultMembers : resultMembers // ignore: cast_nullable_to_non_nullable
as Result<List<MemberModel>>,
  ));
}


}

// dart format on
