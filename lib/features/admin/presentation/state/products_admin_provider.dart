import 'package:experience_app/features/admin/presentation/state/products_admin_dependencies.dart';
import 'package:experience_app/features/admin/presentation/state/products_admin_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsAdminNotifier extends Notifier<ProductsAdminState> {
  @override
  ProductsAdminState build() {
    loadProducts();
    return const ProductsAdminState();
  }

  Future<void> loadProducts() async {
    //   state = state.copyWith(loading: true);
    final products = await ref.read(getProductsProvider).call();
    state = state.copyWith(loading: false, products: products);
    print("");
  }
}
