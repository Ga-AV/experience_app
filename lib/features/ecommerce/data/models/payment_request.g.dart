// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentRequest _$PaymentRequestFromJson(Map<String, dynamic> json) =>
    _PaymentRequest(
      amount: (json['amount'] as num).toDouble(),
      cardNumber: json['cardNumber'] as String,
      currency: json['currency'] as String? ?? 'USD',
    );

Map<String, dynamic> _$PaymentRequestToJson(_PaymentRequest instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'cardNumber': instance.cardNumber,
      'currency': instance.currency,
    };
