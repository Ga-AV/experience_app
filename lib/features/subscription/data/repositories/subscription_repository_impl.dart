import '../../domain/entities/subscription_plan.dart';
import '../../domain/repositories/subscription_repository.dart';
import '../datasource/subscription_local_datasource.dart';

class SubscriptionRepositoryImpl
    implements SubscriptionRepository {
  final SubscriptionLocalDatasource datasource;

  SubscriptionRepositoryImpl(this.datasource);

  @override
  List<SubscriptionPlan> getPlans() {
    return datasource.getPlans();
  }
}