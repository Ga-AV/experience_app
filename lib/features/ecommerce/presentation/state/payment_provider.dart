import 'package:experience_app/core/network/dio_client.dart';
import 'package:experience_app/features/ecommerce/data/datasource/card_local_datasource.dart';
import 'package:experience_app/features/ecommerce/data/datasource/payment_remote_datasource.dart';
import 'package:experience_app/features/ecommerce/data/repositories/payment_repository_impl.dart';
import 'package:experience_app/features/ecommerce/domain/repositories/payment_repository.dart';
import 'package:experience_app/features/ecommerce/domain/usescases/process_payment.dart';
import 'package:experience_app/features/ecommerce/presentation/state/payment_notifier.dart';
import 'package:experience_app/features/ecommerce/presentation/state/payment_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioClientProvider = Provider<DioClient>((ref) {
  return DioClient();
});

final paymentRemoteDataSourceProvider = Provider<PaymentRemoteDataSource>((
  ref,
) {
  return PaymentRemoteDataSourceImpl(ref.read(dioClientProvider));
});

final cardLocalDataSourceProvider = Provider<CardLocalDataSource>((ref) {
  return CardLocalDataSource();
});

final paymentRepositoryProvider = Provider<PaymentRepository>((ref) {
  return PaymentRepositoryImpl(
    remote: ref.read(paymentRemoteDataSourceProvider),
    local: ref.read(cardLocalDataSourceProvider),
  );
});

final processPaymentUseCaseProvider = Provider((ref) {
  return ProcessPayment(ref.read(paymentRepositoryProvider));
});

final paymentProvider = NotifierProvider<PaymentNotifier, PaymentState>(
  PaymentNotifier.new,
);
