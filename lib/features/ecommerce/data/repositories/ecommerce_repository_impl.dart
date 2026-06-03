import 'package:experience_app/features/ecommerce/data/models/product_model.dart';

import '../../domain/entities/product.dart';
import '../../domain/repositories/ecommerce_repository.dart';
import '../datasource/ecommerce_remote_datasource.dart';

class EcommerceRepositoryImpl implements EcommerceRepository {
  final EcommerceRemoteDataSource remoteDataSource;

  EcommerceRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Product>> getProducts() async {
    final products = await remoteDataSource.getProducts();

    return products.map((e) => e.toEntity()).toList();
  }
}