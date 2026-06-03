// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentCard _$PaymentCardFromJson(Map<String, dynamic> json) => _PaymentCard(
  holderName: json['holderName'] as String,
  cardNumber: json['cardNumber'] as String,
  expiryDate: json['expiryDate'] as String,
  cvv: json['cvv'] as String,
  brand: json['brand'] as String,
);

Map<String, dynamic> _$PaymentCardToJson(_PaymentCard instance) =>
    <String, dynamic>{
      'holderName': instance.holderName,
      'cardNumber': instance.cardNumber,
      'expiryDate': instance.expiryDate,
      'cvv': instance.cvv,
      'brand': instance.brand,
    };
