import 'package:experience_app/features/admin/data/models/product_admin_model.dart';
import 'package:flutter/material.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductAdminModel>> getProducts();

  Future<void> addProduct(ProductAdminModel product);

  Future<void> updateProduct(ProductAdminModel product);

  Future<void> deleteProduct(String id);
}