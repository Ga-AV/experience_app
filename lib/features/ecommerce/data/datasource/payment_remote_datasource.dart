import 'package:dio/dio.dart';
import 'package:experience_app/core/constants/api_constants.dart';
import 'package:experience_app/core/errors/exceptions.dart';
import 'package:experience_app/core/network/dio_client.dart';
import 'package:experience_app/features/ecommerce/data/models/payment_request.dart';
import 'package:experience_app/features/ecommerce/data/models/payment_response.dart';


abstract class PaymentRemoteDataSource {
  Future<PaymentResponse> processPayment(PaymentRequest request);
}

class PaymentRemoteDataSourceImpl implements PaymentRemoteDataSource {
  final DioClient client;

  PaymentRemoteDataSourceImpl(this.client);

  @override
  Future<PaymentResponse> processPayment(PaymentRequest request) async {
    try {
      final response = await client.dio.post(
        ApiConstants.processPayment,
        data: request.toJson(),
      );

      return PaymentResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(e.response?.data['message'] ?? 'Payment failed');
    }
  }
}
