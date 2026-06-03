import 'package:experience_app/features/ecommerce/domain/usescases/get_ecommerce_products.dart';
import 'package:experience_app/features/ecommerce/presentation/state/ecommerce_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ecommerce_state.dart';

class EcommerceNotifier extends Notifier<EcommerceState> {
  late final GetEcommerceProducts _getEcommerceProducts;

  @override
  EcommerceState build() {
    _getEcommerceProducts = ref.read(getEcommerceProductsProvider);

    Future.microtask(() {
      loadProducts();
    });

    return const EcommerceState(isLoading: true);
  }

  Future<void> loadProducts() async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      final products = await _getEcommerceProducts();

      state = state.copyWith(
        isLoading: false,
        perfectForYou: products,
        summerProducts: products,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
