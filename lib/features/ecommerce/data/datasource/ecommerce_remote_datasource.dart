
import '../models/product_model.dart';

abstract class EcommerceRemoteDataSource {
  Future<List<ProductModel>> getProducts();
}

class EcommerceRemoteDataSourceImpl
    implements EcommerceRemoteDataSource {

  @override
  Future<List<ProductModel>> getProducts() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      ProductModel(
        id: '1',
        name: 'Amazing T-shirt',
        price: 12,
        image: 'assets/onboarding.png',
      ),
      ProductModel(
        id: '2',
        name: 'Fabolous Pants',
        price: 15,
        image: 'assets/onboarding.png',
      ),
    ];
  }
}