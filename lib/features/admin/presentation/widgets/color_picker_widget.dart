import 'package:flutter/material.dart';

class ColorPicker extends StatelessWidget {
  const ColorPicker({super.key});

  static const colors = [
    Color(0xFF1E1F28),
    Color(0xFF8F8F98),
    Color(0xFFB5B6BC),
    Color(0xFFE3E3E8),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 14,
      children: colors.map((color) {
        return GestureDetector(
          onTap: () {},
          child: CircleAvatar(radius: 18, backgroundColor: color),
        );
      }).toList(),
    );
  }
}
