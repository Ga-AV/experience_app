import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:experience_app/features/ecommerce/data/models/payment_card.dart';
import 'package:experience_app/features/ecommerce/data/models/payment_request.dart';
import 'package:experience_app/features/ecommerce/presentation/state/payment_provider.dart';
import 'package:experience_app/features/ecommerce/presentation/state/payment_state.dart';
import 'package:experience_app/features/ecommerce/presentation/state/cart_provider.dart';
import 'package:experience_app/features/sales/domain/entities/sale.dart';
import 'package:experience_app/features/sales/presentation/state/sales_provider.dart';

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

      // 1. Procesar el pago mediante nuestra API.
      await ref
          .read(processPaymentUseCaseProvider)
          .call(
            PaymentRequest(amount: amount, cardNumber: selected.cardNumber),
          );

      // 2. Obtener el usuario autenticado.
      final user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        throw Exception('No authenticated user');
      }

      // 3. Obtener los productos actuales del carrito.
      final cartState = ref.read(cartProvider);

      if (cartState.items.isEmpty) {
        throw Exception('Cart is empty');
      }

      // 4. Convertir los CartItem en SaleItem.
      final saleItems = cartState.items
          .map(
            (item) => SaleItem(
              productId: item.product.id,
              name: item.product.name,
              price: item.product.price,
              quantity: item.quantity,
              size: item.size,
              color: item.color,
            ),
          )
          .toList();

      // 5. Crear la venta en Firestore.
      final sale = Sale(
        userId: user.uid,
        total: amount,
        estado: 'pagada',
        items: saleItems,
      );

      final saleId = await ref.read(createSaleUseCaseProvider).call(sale);

      // 6. Limpiar el carrito después de crear la venta.
      await ref.read(cartProvider.notifier).clearCart();

      state = state.copyWith(isLoading: false);

      print('Sale created successfully: $saleId');

      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());

      return false;
    }
  }
}
