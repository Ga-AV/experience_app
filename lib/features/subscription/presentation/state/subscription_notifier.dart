import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/subscription_plan.dart';
import '../../domain/repositories/subscription_repository.dart';
import 'subscription_provider.dart';
import 'subscription_state.dart';

class SubscriptionNotifier
    extends Notifier<SubscriptionState> {
  late final SubscriptionRepository _repository;

  @override
  SubscriptionState build() {
    _repository = ref.read(subscriptionRepositoryProvider);

    final plans = _repository.getPlans();

    return SubscriptionState(
      plans: plans,
      selectedPlan: plans.first,
    );
  }

  void selectPlan(SubscriptionPlan plan) {
    state = state.copyWith(selectedPlan: plan);
  }

  Future<void> subscribe() async {
    state = state.copyWith(isLoading: true);

    await Future.delayed(
      const Duration(seconds: 2),
    );

    state = state.copyWith(isLoading: false);

  }
}