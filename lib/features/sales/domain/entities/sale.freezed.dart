// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Sale {

 String get userId; double get total; String get estado; List<SaleItem> get items;
/// Create a copy of Sale
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleCopyWith<Sale> get copyWith => _$SaleCopyWithImpl<Sale>(this as Sale, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Sale&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.total, total) || other.total == total)&&(identical(other.estado, estado) || other.estado == estado)&&const DeepCollectionEquality().equals(other.items, items));
}


@override
int get hashCode => Object.hash(runtimeType,userId,total,estado,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'Sale(userId: $userId, total: $total, estado: $estado, items: $items)';
}


}

/// @nodoc
abstract mixin class $SaleCopyWith<$Res>  {
  factory $SaleCopyWith(Sale value, $Res Function(Sale) _then) = _$SaleCopyWithImpl;
@useResult
$Res call({
 String userId, double total, String estado, List<SaleItem> items
});




}
/// @nodoc
class _$SaleCopyWithImpl<$Res>
    implements $SaleCopyWith<$Res> {
  _$SaleCopyWithImpl(this._self, this._then);

  final Sale _self;
  final $Res Function(Sale) _then;

/// Create a copy of Sale
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? total = null,Object? estado = null,Object? items = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,estado: null == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<SaleItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [Sale].
extension SalePatterns on Sale {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Sale value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Sale() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Sale value)  $default,){
final _that = this;
switch (_that) {
case _Sale():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Sale value)?  $default,){
final _that = this;
switch (_that) {
case _Sale() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  double total,  String estado,  List<SaleItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Sale() when $default != null:
return $default(_that.userId,_that.total,_that.estado,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  double total,  String estado,  List<SaleItem> items)  $default,) {final _that = this;
switch (_that) {
case _Sale():
return $default(_that.userId,_that.total,_that.estado,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  double total,  String estado,  List<SaleItem> items)?  $default,) {final _that = this;
switch (_that) {
case _Sale() when $default != null:
return $default(_that.userId,_that.total,_that.estado,_that.items);case _:
  return null;

}
}

}

/// @nodoc


class _Sale implements Sale {
  const _Sale({required this.userId, required this.total, required this.estado, required final  List<SaleItem> items}): _items = items;
  

@override final  String userId;
@override final  double total;
@override final  String estado;
 final  List<SaleItem> _items;
@override List<SaleItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of Sale
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleCopyWith<_Sale> get copyWith => __$SaleCopyWithImpl<_Sale>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Sale&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.total, total) || other.total == total)&&(identical(other.estado, estado) || other.estado == estado)&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,userId,total,estado,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'Sale(userId: $userId, total: $total, estado: $estado, items: $items)';
}


}

/// @nodoc
abstract mixin class _$SaleCopyWith<$Res> implements $SaleCopyWith<$Res> {
  factory _$SaleCopyWith(_Sale value, $Res Function(_Sale) _then) = __$SaleCopyWithImpl;
@override @useResult
$Res call({
 String userId, double total, String estado, List<SaleItem> items
});




}
/// @nodoc
class __$SaleCopyWithImpl<$Res>
    implements _$SaleCopyWith<$Res> {
  __$SaleCopyWithImpl(this._self, this._then);

  final _Sale _self;
  final $Res Function(_Sale) _then;

/// Create a copy of Sale
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? total = null,Object? estado = null,Object? items = null,}) {
  return _then(_Sale(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,estado: null == estado ? _self.estado : estado // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<SaleItem>,
  ));
}


}

/// @nodoc
mixin _$SaleItem {

 String get productId; String get name; double get price; int get quantity; String get size; String get color;
/// Create a copy of SaleItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaleItemCopyWith<SaleItem> get copyWith => _$SaleItemCopyWithImpl<SaleItem>(this as SaleItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaleItem&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.size, size) || other.size == size)&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,productId,name,price,quantity,size,color);

@override
String toString() {
  return 'SaleItem(productId: $productId, name: $name, price: $price, quantity: $quantity, size: $size, color: $color)';
}


}

/// @nodoc
abstract mixin class $SaleItemCopyWith<$Res>  {
  factory $SaleItemCopyWith(SaleItem value, $Res Function(SaleItem) _then) = _$SaleItemCopyWithImpl;
@useResult
$Res call({
 String productId, String name, double price, int quantity, String size, String color
});




}
/// @nodoc
class _$SaleItemCopyWithImpl<$Res>
    implements $SaleItemCopyWith<$Res> {
  _$SaleItemCopyWithImpl(this._self, this._then);

  final SaleItem _self;
  final $Res Function(SaleItem) _then;

/// Create a copy of SaleItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = null,Object? name = null,Object? price = null,Object? quantity = null,Object? size = null,Object? color = null,}) {
  return _then(_self.copyWith(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SaleItem].
extension SaleItemPatterns on SaleItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SaleItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SaleItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SaleItem value)  $default,){
final _that = this;
switch (_that) {
case _SaleItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SaleItem value)?  $default,){
final _that = this;
switch (_that) {
case _SaleItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String productId,  String name,  double price,  int quantity,  String size,  String color)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SaleItem() when $default != null:
return $default(_that.productId,_that.name,_that.price,_that.quantity,_that.size,_that.color);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String productId,  String name,  double price,  int quantity,  String size,  String color)  $default,) {final _that = this;
switch (_that) {
case _SaleItem():
return $default(_that.productId,_that.name,_that.price,_that.quantity,_that.size,_that.color);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String productId,  String name,  double price,  int quantity,  String size,  String color)?  $default,) {final _that = this;
switch (_that) {
case _SaleItem() when $default != null:
return $default(_that.productId,_that.name,_that.price,_that.quantity,_that.size,_that.color);case _:
  return null;

}
}

}

/// @nodoc


class _SaleItem implements SaleItem {
  const _SaleItem({required this.productId, required this.name, required this.price, required this.quantity, required this.size, required this.color});
  

@override final  String productId;
@override final  String name;
@override final  double price;
@override final  int quantity;
@override final  String size;
@override final  String color;

/// Create a copy of SaleItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SaleItemCopyWith<_SaleItem> get copyWith => __$SaleItemCopyWithImpl<_SaleItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SaleItem&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.size, size) || other.size == size)&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,productId,name,price,quantity,size,color);

@override
String toString() {
  return 'SaleItem(productId: $productId, name: $name, price: $price, quantity: $quantity, size: $size, color: $color)';
}


}

/// @nodoc
abstract mixin class _$SaleItemCopyWith<$Res> implements $SaleItemCopyWith<$Res> {
  factory _$SaleItemCopyWith(_SaleItem value, $Res Function(_SaleItem) _then) = __$SaleItemCopyWithImpl;
@override @useResult
$Res call({
 String productId, String name, double price, int quantity, String size, String color
});




}
/// @nodoc
class __$SaleItemCopyWithImpl<$Res>
    implements _$SaleItemCopyWith<$Res> {
  __$SaleItemCopyWithImpl(this._self, this._then);

  final _SaleItem _self;
  final $Res Function(_SaleItem) _then;

/// Create a copy of SaleItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? name = null,Object? price = null,Object? quantity = null,Object? size = null,Object? color = null,}) {
  return _then(_SaleItem(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
