import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasource/cart_local_datasource.dart';
import 'cart_notifier.dart';
import 'cart_state.dart';

final cartLocalDataSourceProvider =
    Provider<CartLocalDataSource>((ref) {

  return CartLocalDataSource();
});

final cartProvider =
    NotifierProvider<CartNotifier, CartState>(
  CartNotifier.new,
);