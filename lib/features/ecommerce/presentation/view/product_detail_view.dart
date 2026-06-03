import 'package:experience_app/features/ecommerce/data/models/cart_item.dart';
import 'package:experience_app/features/ecommerce/domain/entities/product.dart';
import 'package:experience_app/features/ecommerce/presentation/state/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetailView extends ConsumerStatefulWidget {
  final Product product;

  const ProductDetailView({super.key, required this.product});

  @override
  ConsumerState<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends ConsumerState<ProductDetailView> {
  String selectedSize = 'S';
  String selectedColor = 'Blue';

  final List<String> sizes = ['XS', 'S', 'M', 'L', 'XL'];

  final List<Color> colors = [
    Color(0xFF1E1F28),
    Color(0xFF8F8F98),
    Color(0xFFB5B6BC),
    Color(0xFFE3E3E8),
  ];

  int selectedColorIndex = 2;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F8),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(24, 0, 24, 32),
        child: SizedBox(
          height: 56,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF2563FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: () {
              ref
                  .read(cartProvider.notifier)
                  .addToCart(
                    CartItem(
                      product: product,
                      size: selectedSize,
                      color: selectedColor,
                    ),
                  );

              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("Added to bag")));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  "Add to bag",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 320,
                width: double.infinity,
                color: Color(0xFFE9EEF7),
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 10,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close, size: 32),
                      ),
                    ),

                    Center(
                      child: Image.asset(
                        'assets/onboarding.png',
                        height: 500,
                        width: 500,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "€ ${product.price.toStringAsFixed(2)}",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),

                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_border, size: 28),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      "The perfect T-shirt for when you want to feel comfortable but still stylish. Amazing for all occasions.",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Size",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: sizes.map((size) {
                        final selected = selectedSize == size;
                        return Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = size;
                              });
                            },
                            child: Container(
                              width: 42,
                              height: 30,
                              decoration: BoxDecoration(
                                color: selected
                                    ? const Color(0xFF2563FF)
                                    : const Color(0xFFEFF2F8),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                size,
                                style: TextStyle(
                                  color: selected
                                      ? Colors.white
                                      : const Color(0xFF2563FF),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Color",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: List.generate(colors.length, (index) {
                        final selected = selectedColorIndex == index;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedColorIndex = index;
                              index == 0
                                  ? selectedColor = "Negro"
                                  : index == 1
                                  ? selectedColor = "Gris"
                                  : index == 2
                                  ? selectedColor = "Gris claro"
                                  : index == 3
                                  ? selectedColor = "Blanco"
                                  : selectedColor = "Negro";
                              // selectedColor = "Color $index";
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 16),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 38,
                                  height: 38,
                                  decoration: BoxDecoration(
                                    color: colors[index],
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                if (selected)
                                  const Icon(Icons.check, color: Colors.white),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final bool active;

  const Dot({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: active ? 10 : 8,
      height: active ? 10 : 8,
      decoration: BoxDecoration(
        color: active ? const Color(0xFF2563FF) : Colors.grey.shade300,
        shape: BoxShape.circle,
      ),
    );
  }
}
