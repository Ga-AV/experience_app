import 'package:experience_app/features/sales/domain/entities/sale.dart';
import 'package:experience_app/features/sales/domain/repositories/sales_repository.dart';

class CreateSale {
  final SalesRepository repository;

  CreateSale(this.repository);

  Future<String> call(Sale sale) {
    return repository.createSale(sale);
  }
}
