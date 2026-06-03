import 'package:experience_app/features/ecommerce/data/models/payment_response.dart';

import '../../data/models/payment_request.dart';
import '../repositories/payment_repository.dart';

class ProcessPayment {
  final PaymentRepository repository;

  ProcessPayment(this.repository);

  Future<PaymentResponse> call(PaymentRequest request) {
    return repository.processPayment(request);
  }
}
