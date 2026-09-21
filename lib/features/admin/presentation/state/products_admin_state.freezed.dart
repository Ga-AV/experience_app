// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_admin_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductsAdminState {

 List<ProductAdmin> get products; bool get loading; String? get error;
/// Create a copy of ProductsAdminState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductsAdminStateCopyWith<ProductsAdminState> get copyWith => _$ProductsAdminStateCopyWithImpl<ProductsAdminState>(this as ProductsAdminState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsAdminState&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(products),loading,error);

@override
String toString() {
  return 'ProductsAdminState(products: $products, loading: $loading, error: $error)';
}


}

/// @nodoc
abstract mixin class $ProductsAdminStateCopyWith<$Res>  {
  factory $ProductsAdminStateCopyWith(ProductsAdminState value, $Res Function(ProductsAdminState) _then) = _$ProductsAdminStateCopyWithImpl;
@useResult
$Res call({
 List<ProductAdmin> products, bool loading, String? error
});




}
/// @nodoc
class _$ProductsAdminStateCopyWithImpl<$Res>
    implements $ProductsAdminStateCopyWith<$Res> {
  _$ProductsAdminStateCopyWithImpl(this._self, this._then);

  final ProductsAdminState _self;
  final $Res Function(ProductsAdminState) _then;

/// Create a copy of ProductsAdminState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? products = null,Object? loading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<ProductAdmin>,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductsAdminState].
extension ProductsAdminStatePatterns on ProductsAdminState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductsAdminState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductsAdminState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductsAdminState value)  $default,){
final _that = this;
switch (_that) {
case _ProductsAdminState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductsAdminState value)?  $default,){
final _that = this;
switch (_that) {
case _ProductsAdminState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ProductAdmin> products,  bool loading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductsAdminState() when $default != null:
return $default(_that.products,_that.loading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ProductAdmin> products,  bool loading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _ProductsAdminState():
return $default(_that.products,_that.loading,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ProductAdmin> products,  bool loading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _ProductsAdminState() when $default != null:
return $default(_that.products,_that.loading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _ProductsAdminState implements ProductsAdminState {
  const _ProductsAdminState({final  List<ProductAdmin> products = const [], this.loading = false, this.error}): _products = products;
  

 final  List<ProductAdmin> _products;
@override@JsonKey() List<ProductAdmin> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

@override@JsonKey() final  bool loading;
@override final  String? error;

/// Create a copy of ProductsAdminState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductsAdminStateCopyWith<_ProductsAdminState> get copyWith => __$ProductsAdminStateCopyWithImpl<_ProductsAdminState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductsAdminState&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.loading, loading) || other.loading == loading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products),loading,error);

@override
String toString() {
  return 'ProductsAdminState(products: $products, loading: $loading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ProductsAdminStateCopyWith<$Res> implements $ProductsAdminStateCopyWith<$Res> {
  factory _$ProductsAdminStateCopyWith(_ProductsAdminState value, $Res Function(_ProductsAdminState) _then) = __$ProductsAdminStateCopyWithImpl;
@override @useResult
$Res call({
 List<ProductAdmin> products, bool loading, String? error
});




}
/// @nodoc
class __$ProductsAdminStateCopyWithImpl<$Res>
    implements _$ProductsAdminStateCopyWith<$Res> {
  __$ProductsAdminStateCopyWithImpl(this._self, this._then);

  final _ProductsAdminState _self;
  final $Res Function(_ProductsAdminState) _then;

/// Create a copy of ProductsAdminState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? products = null,Object? loading = null,Object? error = freezed,}) {
  return _then(_ProductsAdminState(
products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductAdmin>,loading: null == loading ? _self.loading : loading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
