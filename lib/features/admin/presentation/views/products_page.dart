import 'package:experience_app/features/admin/presentation/state/products_admin_dependencies.dart';
import 'package:experience_app/features/admin/presentation/state/products_admin_state.dart';
import 'package:experience_app/features/admin/presentation/views/add_product_page.dart';
import 'package:experience_app/features/admin/presentation/widgets/product_search_bar_widget.dart';
import 'package:experience_app/features/admin/presentation/widgets/products_grid_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsPage extends ConsumerWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productsAdminProvider);
    if (state.loading) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      appBar: AppBar(title: const Text("Products")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const ProductSearchBarWidget(),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (_) => AddProductPage()));
                },
                icon: const Icon(Icons.add),
                label: const Text("Add Product"),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(child: ProductsGridWidget(state.products)),
          ],
        ),
      ),
    );
  }
}
