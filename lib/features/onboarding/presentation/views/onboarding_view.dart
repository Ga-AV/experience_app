import 'package:experience_app/features/onboarding/presentation/state/onboarding_provider.dart';
import 'package:experience_app/features/onboarding/presentation/widgets/onboarding_button.dart';
import 'package:experience_app/features/onboarding/presentation/widgets/onboarding_dots.dart';
import 'package:experience_app/features/onboarding/presentation/widgets/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'interests_view.dart';

class OnboardingView extends ConsumerStatefulWidget {
  const OnboardingView({super.key});

  @override
  ConsumerState<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends ConsumerState<OnboardingView> {
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleNext() {
    final notifier = ref.read(onboardingNotifierProvider.notifier);

    final state = ref.read(onboardingNotifierProvider);

    if (!notifier.isLastPage) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (_) => const InterestsView()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(onboardingNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: _controller,
        itemCount: state.items.length,
        onPageChanged: (index) {
          ref.read(onboardingNotifierProvider.notifier).changePage(index);
        },
        itemBuilder: (context, index) {
          final item = state.items[index];

          return Column(
            children: [
              Expanded(flex: 6, child: OnboardingPage(item: item)),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OnboardingDots(
                        currentPage: state.currentPage,
                        total: state.items.length,
                      ),
                      const SizedBox(height: 32),
                      Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),

                      const SizedBox(height: 20),

                      Text(
                        item.subtitle,
                        style: const TextStyle(fontSize: 14, height: 1.5),
                      ),

                      const Spacer(),

                      OnboardingButton(
                        text: notifierLabel(state),
                        onPressed: _handleNext,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  String notifierLabel(state) {
    return state.currentPage == state.items.length - 1 ? "Get Started" : "Next";
  }
}
