import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/payment_card.dart';
part 'payment_state.freezed.dart';

@freezed
abstract class PaymentState with _$PaymentState {
  const factory PaymentState({
    @Default([]) List<PaymentCard> cards,
    PaymentCard? selectedCard,
    @Default(false) bool isLoading,
    String? error,
  }) = _PaymentState;
}
