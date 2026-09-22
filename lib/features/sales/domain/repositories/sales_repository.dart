
import 'package:experience_app/features/sales/domain/entities/sale.dart';

abstract class SalesRepository {
  Future<String> createSale(Sale sale);
}
