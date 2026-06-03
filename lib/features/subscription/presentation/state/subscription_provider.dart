import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasource/subscription_local_datasource.dart';
import '../../data/repositories/subscription_repository_impl.dart';
import '../../domain/repositories/subscription_repository.dart';
import 'subscription_notifier.dart';
import 'subscription_state.dart';

final subscriptionDatasourceProvider =
    Provider<SubscriptionLocalDatasource>(
  (ref) => SubscriptionLocalDatasource(),
);

final subscriptionRepositoryProvider =
    Provider<SubscriptionRepository>(
  (ref) => SubscriptionRepositoryImpl(
    ref.read(subscriptionDatasourceProvider),
  ),
);

final subscriptionNotifierProvider =
    NotifierProvider<
      SubscriptionNotifier,
      SubscriptionState
    >(
  SubscriptionNotifier.new,
);