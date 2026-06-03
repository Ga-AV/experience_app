import 'package:experience_app/features/ecommerce/presentation/widgets/add_card_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/payment_card.dart';
import '../state/payment_provider.dart';

class PaymentView extends ConsumerWidget {
  final double total;

  const PaymentView({super.key, required this.total});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(paymentProvider);
    final notifier = ref.read(paymentProvider.notifier);

    return Scaffold(
      backgroundColor: Color(0xFFF6F6F8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 80,
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Cancel',
            style: TextStyle(color: Color(0xFF2563FF), fontSize: 16),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Checkout',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              _CheckoutStepper(),
              SizedBox(height: 40),
              Text(
                'Choose a payment method',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  height: 1.1,
                ),
              ),

              SizedBox(height: 10),

              Text(
                "You won't be charged until you review the order on the next page",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),

              SizedBox(height: 30),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: Color(0xFFE4E4E7)),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF2563FF),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: CircleAvatar(
                                      radius: 4,
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12),
                                Text(
                                  'Credit Card',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 24),

                            ...state.cards.map((card) {
                              final selected = state.selectedCard == card;

                              return Padding(
                                padding: EdgeInsets.only(bottom: 16),
                                child: _PaymentCardTile(
                                  card: card,
                                  selected: selected,
                                  onTap: () {
                                    notifier.selectCard(card);
                                  },
                                ),
                              );
                            }),
                            SizedBox(height: 6),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (_) => AddCardModal(),
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add, color: Color(0xFF2563FF)),
                                  SizedBox(width: 6),
                                  Text(
                                    'Add new card',
                                    style: TextStyle(
                                      color: Color(0xFF2563FF),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 30),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF2563FF),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 14),
                                Expanded(
                                  child: Text(
                                    'My billing address is the same as my shipping address',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 22,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: Color(0xFFE4E4E7)),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 2,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),

                            SizedBox(width: 14),

                            Text(
                              'Apple Pay',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 64,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF156CF7),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  onPressed: () async {
                    await notifier.processPayment(total);

                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Payment processed')),
                      );
                    }
                  },
                  child: state.isLoading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text(
                          'Process Payment',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _CheckoutStepper extends StatelessWidget {
  const _CheckoutStepper();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _StepItem(title: 'Your bag', done: true, active: false),
        _StepItem(title: 'Shipping', done: true, active: false),
        _StepItem(title: 'Payment', done: false, active: true, number: '3'),
      ],
    );
  }
}

class _StepItem extends StatelessWidget {
  final String title;
  final bool done;
  final bool active;
  final String? number;

  const _StepItem({
    required this.title,
    required this.done,
    required this.active,
    this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: active ? Color(0xFF156CF7) : Color(0xFFD8E9FF),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: done
                ? Icon(Icons.check, color: Color(0xFF156CF7))
                : Text(
                    number ?? '',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),

        SizedBox(height: 10),

        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: active ? FontWeight.bold : FontWeight.w500,
            color: active ? Colors.black : Colors.grey,
          ),
        ),
      ],
    );
  }
}

class _PaymentCardTile extends StatelessWidget {
  final PaymentCard card;
  final bool selected;
  final VoidCallback onTap;

  const _PaymentCardTile({
    required this.card,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: selected ? Color(0xFFEAF2FF) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? Colors.transparent : Color(0xFFDADCE0),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(card.brand, style: TextStyle(fontSize: 18)),

                  SizedBox(height: 8),

                  Text(
                    'xxxx xxxx xxxx ${card.cardNumber.substring(card.cardNumber.length - 4)}',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),

            if (selected) Icon(Icons.check, color: Color(0xFF156CF7), size: 28),
          ],
        ),
      ),
    );
  }
}
