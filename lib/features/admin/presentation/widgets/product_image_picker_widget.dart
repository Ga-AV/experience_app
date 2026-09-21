import 'package:flutter/material.dart';

class ProductImagePicker extends StatelessWidget {
  const ProductImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 220,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_photo_alternate_outlined, size: 50),
            SizedBox(height: 12),
            Text("Select Product Image"),
          ],
        ),
      ),
    );
  }
}
