import '../entities/subscription_plan.dart';

abstract class SubscriptionRepository {
  List<SubscriptionPlan> getPlans();
}