import '../../domain/entities/subscription_plan.dart';

class SubscriptionLocalDatasource {
  List<SubscriptionPlan> getPlans() {
    return const [
      SubscriptionPlan(
        type: SubscriptionType.yearly,
        title: "Yearly",
        price: "€ 94.80",
        billingText: "every year",
        discount: "-66% discount",
        isPopular: true,
      ),
      SubscriptionPlan(
        type: SubscriptionType.monthly,
        title: "Monthly",
        price: "€ 10.90",
        billingText: "every month",
        discount: "-53% discount",
      ),
      SubscriptionPlan(
        type: SubscriptionType.weekly,
        title: "Weekly",
        price: "€ 5.90",
        billingText: "every week",
      ),
    ];
  }
}