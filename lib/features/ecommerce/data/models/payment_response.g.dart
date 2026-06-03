// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentResponse _$PaymentResponseFromJson(Map<String, dynamic> json) =>
    _PaymentResponse(
      success: json['success'] as bool,
      status: json['status'] as String,
      transactionId: json['transactionId'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String,
      cardLast4: json['cardLast4'] as String,
      message: json['message'] as String,
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$PaymentResponseToJson(_PaymentResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'transactionId': instance.transactionId,
      'amount': instance.amount,
      'currency': instance.currency,
      'cardLast4': instance.cardLast4,
      'message': instance.message,
      'timestamp': instance.timestamp,
    };
