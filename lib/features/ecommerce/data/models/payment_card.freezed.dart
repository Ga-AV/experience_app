// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentCard {

 String get holderName; String get cardNumber; String get expiryDate; String get cvv; String get brand;
/// Create a copy of PaymentCard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentCardCopyWith<PaymentCard> get copyWith => _$PaymentCardCopyWithImpl<PaymentCard>(this as PaymentCard, _$identity);

  /// Serializes this PaymentCard to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentCard&&(identical(other.holderName, holderName) || other.holderName == holderName)&&(identical(other.cardNumber, cardNumber) || other.cardNumber == cardNumber)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.cvv, cvv) || other.cvv == cvv)&&(identical(other.brand, brand) || other.brand == brand));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,holderName,cardNumber,expiryDate,cvv,brand);

@override
String toString() {
  return 'PaymentCard(holderName: $holderName, cardNumber: $cardNumber, expiryDate: $expiryDate, cvv: $cvv, brand: $brand)';
}


}

/// @nodoc
abstract mixin class $PaymentCardCopyWith<$Res>  {
  factory $PaymentCardCopyWith(PaymentCard value, $Res Function(PaymentCard) _then) = _$PaymentCardCopyWithImpl;
@useResult
$Res call({
 String holderName, String cardNumber, String expiryDate, String cvv, String brand
});




}
/// @nodoc
class _$PaymentCardCopyWithImpl<$Res>
    implements $PaymentCardCopyWith<$Res> {
  _$PaymentCardCopyWithImpl(this._self, this._then);

  final PaymentCard _self;
  final $Res Function(PaymentCard) _then;

/// Create a copy of PaymentCard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? holderName = null,Object? cardNumber = null,Object? expiryDate = null,Object? cvv = null,Object? brand = null,}) {
  return _then(_self.copyWith(
holderName: null == holderName ? _self.holderName : holderName // ignore: cast_nullable_to_non_nullable
as String,cardNumber: null == cardNumber ? _self.cardNumber : cardNumber // ignore: cast_nullable_to_non_nullable
as String,expiryDate: null == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as String,cvv: null == cvv ? _self.cvv : cvv // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentCard].
extension PaymentCardPatterns on PaymentCard {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentCard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentCard() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentCard value)  $default,){
final _that = this;
switch (_that) {
case _PaymentCard():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentCard value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentCard() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String holderName,  String cardNumber,  String expiryDate,  String cvv,  String brand)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentCard() when $default != null:
return $default(_that.holderName,_that.cardNumber,_that.expiryDate,_that.cvv,_that.brand);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String holderName,  String cardNumber,  String expiryDate,  String cvv,  String brand)  $default,) {final _that = this;
switch (_that) {
case _PaymentCard():
return $default(_that.holderName,_that.cardNumber,_that.expiryDate,_that.cvv,_that.brand);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String holderName,  String cardNumber,  String expiryDate,  String cvv,  String brand)?  $default,) {final _that = this;
switch (_that) {
case _PaymentCard() when $default != null:
return $default(_that.holderName,_that.cardNumber,_that.expiryDate,_that.cvv,_that.brand);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentCard implements PaymentCard {
  const _PaymentCard({required this.holderName, required this.cardNumber, required this.expiryDate, required this.cvv, required this.brand});
  factory _PaymentCard.fromJson(Map<String, dynamic> json) => _$PaymentCardFromJson(json);

@override final  String holderName;
@override final  String cardNumber;
@override final  String expiryDate;
@override final  String cvv;
@override final  String brand;

/// Create a copy of PaymentCard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentCardCopyWith<_PaymentCard> get copyWith => __$PaymentCardCopyWithImpl<_PaymentCard>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentCardToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentCard&&(identical(other.holderName, holderName) || other.holderName == holderName)&&(identical(other.cardNumber, cardNumber) || other.cardNumber == cardNumber)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.cvv, cvv) || other.cvv == cvv)&&(identical(other.brand, brand) || other.brand == brand));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,holderName,cardNumber,expiryDate,cvv,brand);

@override
String toString() {
  return 'PaymentCard(holderName: $holderName, cardNumber: $cardNumber, expiryDate: $expiryDate, cvv: $cvv, brand: $brand)';
}


}

/// @nodoc
abstract mixin class _$PaymentCardCopyWith<$Res> implements $PaymentCardCopyWith<$Res> {
  factory _$PaymentCardCopyWith(_PaymentCard value, $Res Function(_PaymentCard) _then) = __$PaymentCardCopyWithImpl;
@override @useResult
$Res call({
 String holderName, String cardNumber, String expiryDate, String cvv, String brand
});




}
/// @nodoc
class __$PaymentCardCopyWithImpl<$Res>
    implements _$PaymentCardCopyWith<$Res> {
  __$PaymentCardCopyWithImpl(this._self, this._then);

  final _PaymentCard _self;
  final $Res Function(_PaymentCard) _then;

/// Create a copy of PaymentCard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? holderName = null,Object? cardNumber = null,Object? expiryDate = null,Object? cvv = null,Object? brand = null,}) {
  return _then(_PaymentCard(
holderName: null == holderName ? _self.holderName : holderName // ignore: cast_nullable_to_non_nullable
as String,cardNumber: null == cardNumber ? _self.cardNumber : cardNumber // ignore: cast_nullable_to_non_nullable
as String,expiryDate: null == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as String,cvv: null == cvv ? _self.cvv : cvv // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
