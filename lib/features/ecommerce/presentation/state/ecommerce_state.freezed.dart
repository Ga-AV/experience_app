// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ecommerce_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EcommerceState {

 bool get isLoading; List<Product> get perfectForYou; List<Product> get summerProducts; String? get error;
/// Create a copy of EcommerceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EcommerceStateCopyWith<EcommerceState> get copyWith => _$EcommerceStateCopyWithImpl<EcommerceState>(this as EcommerceState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EcommerceState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.perfectForYou, perfectForYou)&&const DeepCollectionEquality().equals(other.summerProducts, summerProducts)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(perfectForYou),const DeepCollectionEquality().hash(summerProducts),error);

@override
String toString() {
  return 'EcommerceState(isLoading: $isLoading, perfectForYou: $perfectForYou, summerProducts: $summerProducts, error: $error)';
}


}

/// @nodoc
abstract mixin class $EcommerceStateCopyWith<$Res>  {
  factory $EcommerceStateCopyWith(EcommerceState value, $Res Function(EcommerceState) _then) = _$EcommerceStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<Product> perfectForYou, List<Product> summerProducts, String? error
});




}
/// @nodoc
class _$EcommerceStateCopyWithImpl<$Res>
    implements $EcommerceStateCopyWith<$Res> {
  _$EcommerceStateCopyWithImpl(this._self, this._then);

  final EcommerceState _self;
  final $Res Function(EcommerceState) _then;

/// Create a copy of EcommerceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? perfectForYou = null,Object? summerProducts = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,perfectForYou: null == perfectForYou ? _self.perfectForYou : perfectForYou // ignore: cast_nullable_to_non_nullable
as List<Product>,summerProducts: null == summerProducts ? _self.summerProducts : summerProducts // ignore: cast_nullable_to_non_nullable
as List<Product>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EcommerceState].
extension EcommerceStatePatterns on EcommerceState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EcommerceState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EcommerceState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EcommerceState value)  $default,){
final _that = this;
switch (_that) {
case _EcommerceState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EcommerceState value)?  $default,){
final _that = this;
switch (_that) {
case _EcommerceState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<Product> perfectForYou,  List<Product> summerProducts,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EcommerceState() when $default != null:
return $default(_that.isLoading,_that.perfectForYou,_that.summerProducts,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<Product> perfectForYou,  List<Product> summerProducts,  String? error)  $default,) {final _that = this;
switch (_that) {
case _EcommerceState():
return $default(_that.isLoading,_that.perfectForYou,_that.summerProducts,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<Product> perfectForYou,  List<Product> summerProducts,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _EcommerceState() when $default != null:
return $default(_that.isLoading,_that.perfectForYou,_that.summerProducts,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _EcommerceState implements EcommerceState {
  const _EcommerceState({this.isLoading = false, final  List<Product> perfectForYou = const [], final  List<Product> summerProducts = const [], this.error}): _perfectForYou = perfectForYou,_summerProducts = summerProducts;
  

@override@JsonKey() final  bool isLoading;
 final  List<Product> _perfectForYou;
@override@JsonKey() List<Product> get perfectForYou {
  if (_perfectForYou is EqualUnmodifiableListView) return _perfectForYou;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_perfectForYou);
}

 final  List<Product> _summerProducts;
@override@JsonKey() List<Product> get summerProducts {
  if (_summerProducts is EqualUnmodifiableListView) return _summerProducts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_summerProducts);
}

@override final  String? error;

/// Create a copy of EcommerceState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EcommerceStateCopyWith<_EcommerceState> get copyWith => __$EcommerceStateCopyWithImpl<_EcommerceState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EcommerceState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._perfectForYou, _perfectForYou)&&const DeepCollectionEquality().equals(other._summerProducts, _summerProducts)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_perfectForYou),const DeepCollectionEquality().hash(_summerProducts),error);

@override
String toString() {
  return 'EcommerceState(isLoading: $isLoading, perfectForYou: $perfectForYou, summerProducts: $summerProducts, error: $error)';
}


}

/// @nodoc
abstract mixin class _$EcommerceStateCopyWith<$Res> implements $EcommerceStateCopyWith<$Res> {
  factory _$EcommerceStateCopyWith(_EcommerceState value, $Res Function(_EcommerceState) _then) = __$EcommerceStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<Product> perfectForYou, List<Product> summerProducts, String? error
});




}
/// @nodoc
class __$EcommerceStateCopyWithImpl<$Res>
    implements _$EcommerceStateCopyWith<$Res> {
  __$EcommerceStateCopyWithImpl(this._self, this._then);

  final _EcommerceState _self;
  final $Res Function(_EcommerceState) _then;

/// Create a copy of EcommerceState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? perfectForYou = null,Object? summerProducts = null,Object? error = freezed,}) {
  return _then(_EcommerceState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,perfectForYou: null == perfectForYou ? _self._perfectForYou : perfectForYou // ignore: cast_nullable_to_non_nullable
as List<Product>,summerProducts: null == summerProducts ? _self._summerProducts : summerProducts // ignore: cast_nullable_to_non_nullable
as List<Product>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
