import 'package:experience_app/features/ecommerce/domain/usescases/get_ecommerce_products.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasource/ecommerce_remote_datasource.dart';
import '../../data/repositories/ecommerce_repository_impl.dart';
import '../../domain/repositories/ecommerce_repository.dart';
import 'ecommerce_notifier.dart';
import 'ecommerce_state.dart';

final ecommerceRemoteDataSourceProvider =
    Provider<EcommerceRemoteDataSource>((ref) {

  return EcommerceRemoteDataSourceImpl();
});

final ecommerceRepositoryProvider =
    Provider<EcommerceRepository>((ref) {

  return EcommerceRepositoryImpl(
    ref.read(ecommerceRemoteDataSourceProvider),
  );
});

final getEcommerceProductsProvider =
    Provider<GetEcommerceProducts>((ref) {

  return GetEcommerceProducts(
    ref.read(ecommerceRepositoryProvider),
  );
});

final productsProvider =
    NotifierProvider<EcommerceNotifier, EcommerceState>(() {

  return EcommerceNotifier();
});