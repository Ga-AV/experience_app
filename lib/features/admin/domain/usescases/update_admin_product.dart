import 'package:experience_app/features/admin/domain/entities/product_admin.dart';
import 'package:experience_app/features/admin/domain/repositories/product_admin_repository.dart';

class UpdateAdminProducts {

  UpdateAdminProducts(this.repository);

  final ProductAdminRepository repository;

  Future<List<ProductAdmin>> call() {
    return repository.getProducts();
  }
}