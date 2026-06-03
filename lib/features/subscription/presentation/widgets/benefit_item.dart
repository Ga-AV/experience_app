import 'package:flutter/material.dart';

class BenefitItem extends StatelessWidget {
  final String text;

  const BenefitItem({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.blue,
          size: 16,
        ),

        const SizedBox(width: 12),

        Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}