import '../../data/models/payment_card.dart';
import '../../data/models/payment_request.dart';
import '../../data/models/payment_response.dart';

abstract class PaymentRepository {
  Future<PaymentResponse> processPayment(PaymentRequest request);

  Future<void> saveCard(PaymentCard card);

  Future<List<PaymentCard>> getSavedCards();
}
