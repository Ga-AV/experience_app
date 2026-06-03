import '../../../../core/errors/exceptions.dart';
import '../../domain/repositories/payment_repository.dart';
import '../datasource/card_local_datasource.dart';
import '../datasource/payment_remote_datasource.dart';
import '../models/payment_card.dart';
import '../models/payment_request.dart';
import '../models/payment_response.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentRemoteDataSource remote;
  final CardLocalDataSource local;

  PaymentRepositoryImpl({required this.remote, required this.local});

  @override
  Future<PaymentResponse> processPayment(PaymentRequest request) async {
    try {
      return await remote.processPayment(request);
    } on ServerException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<void> saveCard(PaymentCard card) async {
    final cards = await local.loadCards();

    await local.saveCards([...cards, card]);
  }

  @override
  Future<List<PaymentCard>> getSavedCards() {
    return local.loadCards();
  }
}
