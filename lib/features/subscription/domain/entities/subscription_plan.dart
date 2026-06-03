import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_plan.freezed.dart';

enum SubscriptionType {
  yearly,
  monthly,
  weekly,
}

@freezed
abstract class SubscriptionPlan with _$SubscriptionPlan {
  const factory SubscriptionPlan({
    required SubscriptionType type,
    required String title,
    required String price,
    required String billingText,
    String? discount,
    @Default(false) bool isPopular,
  }) = _SubscriptionPlan;
}