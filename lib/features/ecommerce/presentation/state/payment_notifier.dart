import 'package:experience_app/features/ecommerce/data/models/payment_card.dart';
import 'package:experience_app/features/ecommerce/data/models/payment_request.dart';
import 'package:experience_app/features/ecommerce/presentation/state/payment_provider.dart';
import 'package:experience_app/features/ecommerce/presentation/state/payment_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentNotifier extends Notifier<PaymentState> {
  @override
  PaymentState build() {
    Future.microtask(loadCards);

    return const PaymentState();
  }

  Future<void> loadCards() async {
    final cards = await ref.read(paymentRepositoryProvider).getSavedCards();

    state = state.copyWith(
      cards: cards,
      selectedCard: cards.isNotEmpty ? cards.first : null,
    );
  }

  Future<void> addCard(PaymentCard card) async {
    await ref.read(paymentRepositoryProvider).saveCard(card);

    await loadCards();
  }

  void selectCard(PaymentCard card) {
    state = state.copyWith(selectedCard: card);
  }

  Future<bool> processPayment(double amount) async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final selected = state.selectedCard;

      if (selected == null) {
        throw Exception('Select a card');
      }

      await ref
          .read(processPaymentUseCaseProvider)
          .call(
            PaymentRequest(amount: amount, cardNumber: selected.cardNumber),
          );

      state = state.copyWith(isLoading: false);

      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());

      return false;
    }
  }
}
