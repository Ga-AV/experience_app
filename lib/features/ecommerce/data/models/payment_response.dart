import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_response.freezed.dart';
part 'payment_response.g.dart';

@freezed
abstract class PaymentResponse with _$PaymentResponse {
  const factory PaymentResponse({
    required bool success,
    required String status,
    required String transactionId,
    required double amount,
    required String currency,
    required String cardLast4,
    required String message,
    required String timestamp,
  }) = _PaymentResponse;

  factory PaymentResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PaymentResponseFromJson(json);
}