import 'package:experience_app/features/admin/data/datasource/mock_product_remote_datasource.dart';
import 'package:experience_app/features/admin/data/datasource/product_admin_remote_datasource.dart';
import 'package:experience_app/features/admin/data/repositories/product_admin_repository_impl.dart';
import 'package:experience_app/features/admin/domain/repositories/product_admin_repository.dart';
import 'package:experience_app/features/admin/domain/usescases/get_admin_products.dart';
import 'package:experience_app/features/admin/presentation/state/products_admin_provider.dart';
import 'package:experience_app/features/admin/presentation/state/products_admin_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final datasourceProvider = Provider<ProductRemoteDataSource>((ref) {
  return MockProductRemoteDataSource();
});

final repositoryProvider = Provider<ProductAdminRepository>((ref) {
  return ProductAdminRepositoryImpl(ref.watch(datasourceProvider));
});

final getProductsProvider = Provider<GetAdminProducts>((ref) {
  return GetAdminProducts(ref.watch(repositoryProvider));
});

  final productsAdminProvider =
      NotifierProvider<ProductsAdminNotifier, ProductsAdminState>(
        ProductsAdminNotifier.new,
      );
