// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_admin_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductAdminModel {

 String get id; String get name; String get description; double get price; String get size; int get colorValue; String? get imageUrl;
/// Create a copy of ProductAdminModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductAdminModelCopyWith<ProductAdminModel> get copyWith => _$ProductAdminModelCopyWithImpl<ProductAdminModel>(this as ProductAdminModel, _$identity);

  /// Serializes this ProductAdminModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductAdminModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.size, size) || other.size == size)&&(identical(other.colorValue, colorValue) || other.colorValue == colorValue)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,price,size,colorValue,imageUrl);

@override
String toString() {
  return 'ProductAdminModel(id: $id, name: $name, description: $description, price: $price, size: $size, colorValue: $colorValue, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $ProductAdminModelCopyWith<$Res>  {
  factory $ProductAdminModelCopyWith(ProductAdminModel value, $Res Function(ProductAdminModel) _then) = _$ProductAdminModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, double price, String size, int colorValue, String? imageUrl
});




}
/// @nodoc
class _$ProductAdminModelCopyWithImpl<$Res>
    implements $ProductAdminModelCopyWith<$Res> {
  _$ProductAdminModelCopyWithImpl(this._self, this._then);

  final ProductAdminModel _self;
  final $Res Function(ProductAdminModel) _then;

/// Create a copy of ProductAdminModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? price = null,Object? size = null,Object? colorValue = null,Object? imageUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String,colorValue: null == colorValue ? _self.colorValue : colorValue // ignore: cast_nullable_to_non_nullable
as int,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductAdminModel].
extension ProductAdminModelPatterns on ProductAdminModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductAdminModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductAdminModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductAdminModel value)  $default,){
final _that = this;
switch (_that) {
case _ProductAdminModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductAdminModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProductAdminModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  double price,  String size,  int colorValue,  String? imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductAdminModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.price,_that.size,_that.colorValue,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  double price,  String size,  int colorValue,  String? imageUrl)  $default,) {final _that = this;
switch (_that) {
case _ProductAdminModel():
return $default(_that.id,_that.name,_that.description,_that.price,_that.size,_that.colorValue,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  double price,  String size,  int colorValue,  String? imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _ProductAdminModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.price,_that.size,_that.colorValue,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductAdminModel implements ProductAdminModel {
  const _ProductAdminModel({required this.id, required this.name, required this.description, required this.price, required this.size, required this.colorValue, this.imageUrl});
  factory _ProductAdminModel.fromJson(Map<String, dynamic> json) => _$ProductAdminModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String description;
@override final  double price;
@override final  String size;
@override final  int colorValue;
@override final  String? imageUrl;

/// Create a copy of ProductAdminModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductAdminModelCopyWith<_ProductAdminModel> get copyWith => __$ProductAdminModelCopyWithImpl<_ProductAdminModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductAdminModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductAdminModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.size, size) || other.size == size)&&(identical(other.colorValue, colorValue) || other.colorValue == colorValue)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,price,size,colorValue,imageUrl);

@override
String toString() {
  return 'ProductAdminModel(id: $id, name: $name, description: $description, price: $price, size: $size, colorValue: $colorValue, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$ProductAdminModelCopyWith<$Res> implements $ProductAdminModelCopyWith<$Res> {
  factory _$ProductAdminModelCopyWith(_ProductAdminModel value, $Res Function(_ProductAdminModel) _then) = __$ProductAdminModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, double price, String size, int colorValue, String? imageUrl
});




}
/// @nodoc
class __$ProductAdminModelCopyWithImpl<$Res>
    implements _$ProductAdminModelCopyWith<$Res> {
  __$ProductAdminModelCopyWithImpl(this._self, this._then);

  final _ProductAdminModel _self;
  final $Res Function(_ProductAdminModel) _then;

/// Create a copy of ProductAdminModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? price = null,Object? size = null,Object? colorValue = null,Object? imageUrl = freezed,}) {
  return _then(_ProductAdminModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String,colorValue: null == colorValue ? _self.colorValue : colorValue // ignore: cast_nullable_to_non_nullable
as int,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
