import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/subscription_plan.dart';

part 'subscription_state.freezed.dart';

@freezed
abstract class SubscriptionState with _$SubscriptionState {
  const factory SubscriptionState({
    @Default([]) List<SubscriptionPlan> plans,
    SubscriptionPlan? selectedPlan,
    @Default(false) bool isLoading,
  }) = _SubscriptionState;
}