import '../entities/product.dart';
import '../repositories/ecommerce_repository.dart';

class GetEcommerceProducts {
  final EcommerceRepository repository;

  GetEcommerceProducts(this.repository);

  Future<List<Product>> call() {
    return repository.getProducts();
  }
}