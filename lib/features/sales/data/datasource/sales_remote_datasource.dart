import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:experience_app/features/sales/domain/entities/sale.dart';

abstract class SalesRemoteDataSource {
  Future<String> createSale(Sale sale);
}

class SalesRemoteDataSourceImpl implements SalesRemoteDataSource {
  final FirebaseFirestore firestore;

  SalesRemoteDataSourceImpl(this.firestore);

  @override
  Future<String> createSale(Sale sale) async {
    final document = firestore.collection('sales').doc();

    await document.set({
      'user_id': sale.userId,
      'total': sale.total,
      'estado': sale.estado,
      'created_at': FieldValue.serverTimestamp(),
      'items': sale.items
          .map(
            (item) => {
              'product_id': item.productId,
              'name': item.name,
              'price': item.price,
              'quantity': item.quantity,
              'size': item.size,
              'color': item.color,
            },
          )
          .toList(),
    });

    return document.id;
  }
}
