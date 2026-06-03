import 'package:flutter/material.dart';

import '../../domain/entities/onboarding_item.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingItem item;

  const OnboardingPage({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 6,
          child: Container(
            width: double.infinity,
            color: const Color(0xFFDDE3EC),
            child: Center(
              child: Image.asset(item.image, width: 800),
            ),
          ),
        ),
      ],
    );
  }
}