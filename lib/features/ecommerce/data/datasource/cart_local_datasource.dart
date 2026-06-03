import 'dart:convert';

import 'package:experience_app/features/ecommerce/data/models/cart_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartLocalDataSource {
  static const _cartKey = 'cart_items';

  Future<void> saveCart(List<CartItem> items) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = items.map((e) => jsonEncode(e.toJson())).toList();
    await prefs.setStringList(_cartKey, jsonList);
  }

  Future<List<CartItem>> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList(_cartKey);
    if (jsonList == null) {
      return [];
    }
    return jsonList.map((e) => CartItem.fromJson(jsonDecode(e))).toList();
  }

  Future<void> clearCart() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_cartKey);
  }
}
