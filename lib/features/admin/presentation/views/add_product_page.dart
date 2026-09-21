import 'package:experience_app/features/admin/presentation/widgets/product_image_picker_widget.dart';
import 'package:experience_app/features/admin/presentation/widgets/product_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddProductPage extends ConsumerWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Product")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: const [
            ProductImagePicker(),
            SizedBox(height: 24),
            ProductForm(),
          ],
        ),
      ),
    );
  }
}
