import 'package:experience_app/features/admin/presentation/widgets/color_picker_widget.dart';
import 'package:flutter/material.dart';

class ProductForm extends StatelessWidget {
  const ProductForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Product Name",
                prefixIcon: Icon(Icons.shopping_bag_outlined),
              ),
            ),

            const SizedBox(height: 20),

            TextFormField(
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: "Description",
                alignLabelWithHint: true,
              ),
            ),

            const SizedBox(height: 20),

            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Price",
                prefixText: "\$ ",
              ),
            ),

            const SizedBox(height: 20),

            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: "Size"),
              items: const [
                DropdownMenuItem(value: "XS", child: Text("XS")),
                DropdownMenuItem(value: "S", child: Text("S")),
                DropdownMenuItem(value: "M", child: Text("M")),
                DropdownMenuItem(value: "L", child: Text("L")),
                DropdownMenuItem(value: "XL", child: Text("XL")),
              ],
              onChanged: (_) {},
            ),

            const SizedBox(height: 20),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Color",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 12),

            const ColorPicker(),

            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.save),
                label: const Text("Save Product"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
