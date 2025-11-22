// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MainFailure {

 String get errorMsg;
/// Create a copy of MainFailure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MainFailureCopyWith<MainFailure> get copyWith => _$MainFailureCopyWithImpl<MainFailure>(this as MainFailure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MainFailure&&(identical(other.errorMsg, errorMsg) || other.errorMsg == errorMsg));
}


@override
int get hashCode => Object.hash(runtimeType,errorMsg);

@override
String toString() {
  return 'MainFailure(errorMsg: $errorMsg)';
}


}

/// @nodoc
abstract mixin class $MainFailureCopyWith<$Res>  {
  factory $MainFailureCopyWith(MainFailure value, $Res Function(MainFailure) _then) = _$MainFailureCopyWithImpl;
@useResult
$Res call({
 String errorMsg
});




}
/// @nodoc
class _$MainFailureCopyWithImpl<$Res>
    implements $MainFailureCopyWith<$Res> {
  _$MainFailureCopyWithImpl(this._self, this._then);

  final MainFailure _self;
  final $Res Function(MainFailure) _then;

/// Create a copy of MainFailure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? errorMsg = null,}) {
  return _then(_self.copyWith(
errorMsg: null == errorMsg ? _self.errorMsg : errorMsg // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MainFailure].
extension MainFailurePatterns on MainFailure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CustomError value)?  customError,TResult Function( GenericError value)?  genericError,TResult Function( InvalidReferralCode value)?  invalidReferralCode,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CustomError() when customError != null:
return customError(_that);case GenericError() when genericError != null:
return genericError(_that);case InvalidReferralCode() when invalidReferralCode != null:
return invalidReferralCode(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CustomError value)  customError,required TResult Function( GenericError value)  genericError,required TResult Function( InvalidReferralCode value)  invalidReferralCode,}){
final _that = this;
switch (_that) {
case CustomError():
return customError(_that);case GenericError():
return genericError(_that);case InvalidReferralCode():
return invalidReferralCode(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CustomError value)?  customError,TResult? Function( GenericError value)?  genericError,TResult? Function( InvalidReferralCode value)?  invalidReferralCode,}){
final _that = this;
switch (_that) {
case CustomError() when customError != null:
return customError(_that);case GenericError() when genericError != null:
return genericError(_that);case InvalidReferralCode() when invalidReferralCode != null:
return invalidReferralCode(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String errorMsg)?  customError,TResult Function( String errorMsg)?  genericError,TResult Function( String errorMsg)?  invalidReferralCode,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CustomError() when customError != null:
return customError(_that.errorMsg);case GenericError() when genericError != null:
return genericError(_that.errorMsg);case InvalidReferralCode() when invalidReferralCode != null:
return invalidReferralCode(_that.errorMsg);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String errorMsg)  customError,required TResult Function( String errorMsg)  genericError,required TResult Function( String errorMsg)  invalidReferralCode,}) {final _that = this;
switch (_that) {
case CustomError():
return customError(_that.errorMsg);case GenericError():
return genericError(_that.errorMsg);case InvalidReferralCode():
return invalidReferralCode(_that.errorMsg);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String errorMsg)?  customError,TResult? Function( String errorMsg)?  genericError,TResult? Function( String errorMsg)?  invalidReferralCode,}) {final _that = this;
switch (_that) {
case CustomError() when customError != null:
return customError(_that.errorMsg);case GenericError() when genericError != null:
return genericError(_that.errorMsg);case InvalidReferralCode() when invalidReferralCode != null:
return invalidReferralCode(_that.errorMsg);case _:
  return null;

}
}

}

/// @nodoc


class CustomError implements MainFailure {
  const CustomError({required this.errorMsg});
  

@override final  String errorMsg;

/// Create a copy of MainFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomErrorCopyWith<CustomError> get copyWith => _$CustomErrorCopyWithImpl<CustomError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomError&&(identical(other.errorMsg, errorMsg) || other.errorMsg == errorMsg));
}


@override
int get hashCode => Object.hash(runtimeType,errorMsg);

@override
String toString() {
  return 'MainFailure.customError(errorMsg: $errorMsg)';
}


}

/// @nodoc
abstract mixin class $CustomErrorCopyWith<$Res> implements $MainFailureCopyWith<$Res> {
  factory $CustomErrorCopyWith(CustomError value, $Res Function(CustomError) _then) = _$CustomErrorCopyWithImpl;
@override @useResult
$Res call({
 String errorMsg
});




}
/// @nodoc
class _$CustomErrorCopyWithImpl<$Res>
    implements $CustomErrorCopyWith<$Res> {
  _$CustomErrorCopyWithImpl(this._self, this._then);

  final CustomError _self;
  final $Res Function(CustomError) _then;

/// Create a copy of MainFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? errorMsg = null,}) {
  return _then(CustomError(
errorMsg: null == errorMsg ? _self.errorMsg : errorMsg // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class GenericError implements MainFailure {
  const GenericError({required this.errorMsg});
  

@override final  String errorMsg;

/// Create a copy of MainFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenericErrorCopyWith<GenericError> get copyWith => _$GenericErrorCopyWithImpl<GenericError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenericError&&(identical(other.errorMsg, errorMsg) || other.errorMsg == errorMsg));
}


@override
int get hashCode => Object.hash(runtimeType,errorMsg);

@override
String toString() {
  return 'MainFailure.genericError(errorMsg: $errorMsg)';
}


}

/// @nodoc
abstract mixin class $GenericErrorCopyWith<$Res> implements $MainFailureCopyWith<$Res> {
  factory $GenericErrorCopyWith(GenericError value, $Res Function(GenericError) _then) = _$GenericErrorCopyWithImpl;
@override @useResult
$Res call({
 String errorMsg
});




}
/// @nodoc
class _$GenericErrorCopyWithImpl<$Res>
    implements $GenericErrorCopyWith<$Res> {
  _$GenericErrorCopyWithImpl(this._self, this._then);

  final GenericError _self;
  final $Res Function(GenericError) _then;

/// Create a copy of MainFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? errorMsg = null,}) {
  return _then(GenericError(
errorMsg: null == errorMsg ? _self.errorMsg : errorMsg // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class InvalidReferralCode implements MainFailure {
  const InvalidReferralCode({required this.errorMsg});
  

@override final  String errorMsg;

/// Create a copy of MainFailure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvalidReferralCodeCopyWith<InvalidReferralCode> get copyWith => _$InvalidReferralCodeCopyWithImpl<InvalidReferralCode>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvalidReferralCode&&(identical(other.errorMsg, errorMsg) || other.errorMsg == errorMsg));
}


@override
int get hashCode => Object.hash(runtimeType,errorMsg);

@override
String toString() {
  return 'MainFailure.invalidReferralCode(errorMsg: $errorMsg)';
}


}

/// @nodoc
abstract mixin class $InvalidReferralCodeCopyWith<$Res> implements $MainFailureCopyWith<$Res> {
  factory $InvalidReferralCodeCopyWith(InvalidReferralCode value, $Res Function(InvalidReferralCode) _then) = _$InvalidReferralCodeCopyWithImpl;
@override @useResult
$Res call({
 String errorMsg
});




}
/// @nodoc
class _$InvalidReferralCodeCopyWithImpl<$Res>
    implements $InvalidReferralCodeCopyWith<$Res> {
  _$InvalidReferralCodeCopyWithImpl(this._self, this._then);

  final InvalidReferralCode _self;
  final $Res Function(InvalidReferralCode) _then;

/// Create a copy of MainFailure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? errorMsg = null,}) {
  return _then(InvalidReferralCode(
errorMsg: null == errorMsg ? _self.errorMsg : errorMsg // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
