import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:experience_app/features/sales/data/datasource/sales_remote_datasource.dart';
import 'package:experience_app/features/sales/data/repositories/sales_repository_impl.dart';
import 'package:experience_app/features/sales/domain/repositories/sales_repository.dart';
import 'package:experience_app/features/sales/domain/usescases/create_sale.dart';

final salesRemoteDataSourceProvider =
    Provider<SalesRemoteDataSource>((ref) {
  return SalesRemoteDataSourceImpl(
    FirebaseFirestore.instance,
  );
});

final salesRepositoryProvider = Provider<SalesRepository>((ref) {
  return SalesRepositoryImpl(
    ref.read(salesRemoteDataSourceProvider),
  );
});

final createSaleUseCaseProvider = Provider<CreateSale>((ref) {
  return CreateSale(
    ref.read(salesRepositoryProvider),
  );
});
