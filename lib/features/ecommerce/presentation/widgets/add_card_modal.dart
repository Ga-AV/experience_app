import 'package:experience_app/core/utils/card_utils.dart';
import 'package:experience_app/features/ecommerce/data/models/payment_card.dart';
import 'package:experience_app/features/ecommerce/presentation/state/payment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddCardModal extends ConsumerStatefulWidget {
  const AddCardModal();

  @override
  ConsumerState<AddCardModal> createState() => _AddCardModalState();
}

class _AddCardModalState extends ConsumerState<AddCardModal> {
  final nameController = TextEditingController();

  final numberController = TextEditingController();

  final expiryController = TextEditingController();

  final cvvController = TextEditingController();

  InputDecoration decoration(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: const Color(0xFFF4F4F6),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 60,
              height: 6,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Add New Card',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            TextField(
              controller: nameController,
              decoration: decoration('Card Holder'),
            ),

            const SizedBox(height: 18),

            TextField(
              controller: numberController,
              keyboardType: TextInputType.number,
              decoration: decoration('Card Number'),
            ),

            const SizedBox(height: 18),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: expiryController,
                    decoration: decoration('MM/YY'),
                  ),
                ),

                const SizedBox(width: 14),

                Expanded(
                  child: TextField(
                    controller: cvvController,
                    keyboardType: TextInputType.number,
                    decoration: decoration('CVV'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 58,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF156CF7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                onPressed: () async {
                  await ref
                      .read(paymentProvider.notifier)
                      .addCard(
                        PaymentCard(
                          holderName: nameController.text,
                          cardNumber: numberController.text,
                          expiryDate: expiryController.text,
                          cvv: cvvController.text,
                          brand: CardUtils.detectBrand(numberController.text),
                        ),
                      );

                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
                child: const Text(
                  'Save Card',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
