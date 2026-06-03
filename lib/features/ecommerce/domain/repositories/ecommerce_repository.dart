import '../entities/product.dart';

abstract class EcommerceRepository {
  Future<List<Product>> getProducts();
}