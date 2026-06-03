import 'package:flutter/material.dart';

class OnboardingDots extends StatelessWidget {
  final int currentPage;
  final int total;

  const OnboardingDots({
    super.key,
    required this.currentPage,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        total,
        (index) => Container(
          margin: const EdgeInsets.only(right: 8),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color:
                currentPage == index ? Colors.blue : Colors.grey.shade300,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}