import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasource/onboarding_local_datasource.dart';
import '../../domain/repositories/onboarding_repository.dart';
import 'onboarding_notifier.dart';
import 'onboarding_state.dart';

final onboardingRepositoryProvider =
    Provider<OnboardingRepository>(
  (ref) => OnboardingLocalDatasource(),
);

final onboardingNotifierProvider =
    NotifierProvider<OnboardingNotifier, OnboardingState>(
  OnboardingNotifier.new,
);