import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/payment_card.dart';

class CardLocalDataSource {
  static const _key = 'saved_cards';

  Future<void> saveCards(List<PaymentCard> cards) async {
    final prefs = await SharedPreferences.getInstance();
    final data = cards.map((e) => jsonEncode(e.toJson())).toList();
    await prefs.setStringList(_key, data);
  }

  Future<List<PaymentCard>> loadCards() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_key);
    if (list == null) return [];
    return list.map((e) => PaymentCard.fromJson(jsonDecode(e))).toList();
  }
}
