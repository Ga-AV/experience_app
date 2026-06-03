import 'package:experience_app/features/ecommerce/presentation/view/ecommerce_view.dart';
import 'package:experience_app/features/subscription/presentation/state/subscription_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/benefit_item.dart';
import '../widgets/plan_card.dart';
import '../widgets/subscribe_button.dart';

class SubscriptionView extends ConsumerWidget {
  const SubscriptionView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(subscriptionNotifierProvider);

    final notifier = ref.read(subscriptionNotifierProvider.notifier);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 32),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Choose your\nsubscription plan",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    height: 1.1,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "And get a 7-day free trial",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),

              const SizedBox(height: 40),

              Expanded(
                child: ListView.separated(
                  itemCount: state.plans.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 20),
                  itemBuilder: (context, index) {
                    final plan = state.plans[index];

                    final selected = state.selectedPlan == plan;

                    return PlanCard(
                      plan: plan,
                      selected: selected,
                      onTap: () {
                        notifier.selectPlan(plan);
                      },
                    );
                  },
                ),
              ),

              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F2F8),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "You'll get:",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 20),

                    BenefitItem(text: "Unlimited access"),

                    SizedBox(height: 16),

                    BenefitItem(text: "200GB storage"),

                    SizedBox(height: 16),

                    BenefitItem(text: "Sync all your devices"),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              SubscribeButton(
                loading: state.isLoading,
                onPressed: () => {
                  notifier.subscribe,
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const EcommerceView()),
                  ),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
