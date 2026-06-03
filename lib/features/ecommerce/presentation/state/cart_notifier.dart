import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/cart_item.dart';
import '../../data/datasource/cart_local_datasource.dart';
import 'cart_provider.dart';
import 'cart_state.dart';

class CartNotifier extends Notifier<CartState> {
  late final CartLocalDataSource _localDataSource;

  @override
  CartState build() {
    _localDataSource = ref.read(cartLocalDataSourceProvider);

    Future.microtask(() {
      _loadCart();
    });

    return const CartState();
  }

  Future<void> _loadCart() async {
    final items = await _localDataSource.loadCart();

    state = state.copyWith(items: items);
  }

  Future<void> _saveCart() async {
    await _localDataSource.saveCart(state.items);
  }

  Future<void> addToCart(CartItem item) async {
    final existingIndex = state.items.indexWhere(
      (e) =>
          e.product.id == item.product.id &&
          e.size == item.size &&
          e.color == item.color,
    );

    if (existingIndex >= 0) {
      final updatedItems = [...state.items];

      updatedItems[existingIndex] = updatedItems[existingIndex].copyWith(
        quantity: updatedItems[existingIndex].quantity + 1,
      );

      state = state.copyWith(items: updatedItems);

      await _saveCart();

      return;
    }

    state = state.copyWith(items: [...state.items, item]);

    await _saveCart();
  }

  Future<void> removeFromCart(CartItem item) async {
    state = state.copyWith(items: state.items.where((e) => e != item).toList());

    await _saveCart();
  }

  Future<void> incrementQuantity(CartItem item) async {
    final updatedItems = state.items.map((e) {
      if (e == item) {
        return e.copyWith(quantity: e.quantity + 1);
      }

      return e;
    }).toList();

    state = state.copyWith(items: updatedItems);

    await _saveCart();
  }

  Future<void> decrementQuantity(CartItem item) async {
    final updatedItems = state.items
        .map((e) {
          if (e == item) {
            return e.copyWith(quantity: e.quantity - 1);
          }

          return e;
        })
        .where((e) => e.quantity > 0)
        .toList();

    state = state.copyWith(items: updatedItems);

    await _saveCart();
  }

  double get totalPrice {
    return state.items.fold(
      0,
      (sum, item) => sum + (item.product.price * item.quantity),
    );
  }

  int get totalItems {
    return state.items.fold(0, (sum, item) => sum + item.quantity);
  }

  Future<void> clearCart() async {
    state = const CartState();

    await _localDataSource.clearCart();
  }
}
