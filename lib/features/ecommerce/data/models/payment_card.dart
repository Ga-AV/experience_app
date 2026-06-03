import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_card.freezed.dart';
part 'payment_card.g.dart';

@freezed
abstract class PaymentCard with _$PaymentCard {
  const factory PaymentCard({
    required String holderName,
    required String cardNumber,
    required String expiryDate,
    required String cvv,
    required String brand,
  }) = _PaymentCard;

  factory PaymentCard.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PaymentCardFromJson(json);
}