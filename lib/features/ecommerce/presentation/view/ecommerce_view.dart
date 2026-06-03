import 'package:experience_app/features/ecommerce/domain/entities/product.dart';
import 'package:experience_app/features/ecommerce/presentation/state/cart_provider.dart';
import 'package:experience_app/features/ecommerce/presentation/state/ecommerce_provider.dart';
import 'package:experience_app/features/ecommerce/presentation/view/cart_view.dart';
import 'package:experience_app/features/ecommerce/presentation/widgets/banner_carousel.dart';
import 'package:experience_app/features/ecommerce/presentation/widgets/product_card.dart';
import 'package:experience_app/features/onboarding/presentation/views/interests_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EcommerceView extends ConsumerWidget {
  const EcommerceView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productsProvider);
    final totalItems = ref
        .watch(cartProvider)
        .items
        .fold(0, (sum, item) => sum + item.quantity);

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
            backgroundColor: Color.fromARGB(255, 185, 211, 255),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'Categories',
            backgroundColor: Color.fromARGB(255, 185, 211, 255),
          ),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Stores'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),

      body: SafeArea(
        child: state.isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 12),
                    _buildTopBar(context, totalItems),
                    SizedBox(height: 16),
                    BannerCarousel(),
                    SizedBox(height: 24),
                    _section(
                      title: "Perfect for you",
                      products: state.perfectForYou,
                    ),
                    SizedBox(height: 24),
                    _section(
                      title: "For this summer",
                      products: state.summerProducts,
                    ),
                    SizedBox(height: 24),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildTopBar(context, totalItems) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.search, size: 28),
          Row(
            children: [
              Icon(Icons.favorite_border),
              SizedBox(width: 16),
              InkWell(
                child: Stack(
                  children: [
                    Icon(Icons.shopping_bag_outlined),
                    Positioned(
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '$totalItems',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () => {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (_) => const CartView())),
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _section({required String title, required List<Product> products}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(onPressed: () {}, child: const Text('See more')),
            ],
          ),

          const SizedBox(height: 12),

          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];

                return ProductCard(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
