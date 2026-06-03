import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerCarousel extends StatelessWidget {
  const BannerCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 220,
        autoPlay: true,
        viewportFraction: 1,
        autoPlayInterval: Duration(seconds: 10),
      ),
      items: [1, 2, 3].map((e) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.blue.shade100,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.asset(
              'assets/onboarding.png',
              height: 100,
              width: 500,
              fit: BoxFit.cover,
            ),
          ),
        );
      }).toList(),
    );
  }
}
