import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_request.freezed.dart';
part 'payment_request.g.dart';

@freezed
abstract class PaymentRequest with _$PaymentRequest {
  const factory PaymentRequest({
    required double amount,
    required String cardNumber,
    @Default('USD') String currency,
  }) = _PaymentRequest;

  factory PaymentRequest.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PaymentRequestFromJson(json);
}