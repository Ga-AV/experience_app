import 'package:experience_app/features/sales/data/datasource/sales_remote_datasource.dart';
import 'package:experience_app/features/sales/domain/entities/sale.dart';
import 'package:experience_app/features/sales/domain/repositories/sales_repository.dart';

class SalesRepositoryImpl implements SalesRepository {
  final SalesRemoteDataSource remote;

  SalesRepositoryImpl(this.remote);

  @override
  Future<String> createSale(Sale sale) {
    return remote.createSale(sale);
  }
}
