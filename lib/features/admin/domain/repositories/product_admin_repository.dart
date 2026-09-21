import 'package:experience_app/features/admin/data/datasource/product_admin_remote_datasource.dart';
import 'package:experience_app/features/admin/data/mappers/product_admin_mapper.dart';
import 'package:experience_app/features/admin/domain/entities/product_admin.dart';

abstract class ProductAdminRepository {
  Future<List<ProductAdmin>> getProducts();

  Future<void> addProduct(ProductAdmin product);

  Future<void> updateProduct(ProductAdmin product);

  Future<void> deleteProduct(String id);
}
