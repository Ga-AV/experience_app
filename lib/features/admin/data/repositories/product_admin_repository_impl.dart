import 'package:experience_app/features/admin/data/datasource/product_admin_remote_datasource.dart';
import 'package:experience_app/features/admin/data/mappers/product_admin_mapper.dart';
import 'package:experience_app/features/admin/domain/entities/product_admin.dart';
import 'package:experience_app/features/admin/domain/repositories/product_admin_repository.dart';

class ProductAdminRepositoryImpl implements ProductAdminRepository {
  ProductAdminRepositoryImpl(this.datasource);

  final ProductRemoteDataSource datasource;

  @override
  Future<List<ProductAdmin>> getProducts() async {
    final products = await datasource.getProducts();

    return products.map((e) => e.toEntity()).toList();
  }

  @override
  Future<void> addProduct(ProductAdmin product) {
    return datasource.addProduct(product.toModel());
  }

  @override
  Future<void> updateProduct(ProductAdmin product) {
    return datasource.updateProduct(product.toModel());
  }

  @override
  Future<void> deleteProduct(String id) {
    return datasource.deleteProduct(id);
  }
}
