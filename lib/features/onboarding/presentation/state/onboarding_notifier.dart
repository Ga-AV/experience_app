import 'package:experience_app/features/onboarding/presentation/state/onboarding_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repositories/onboarding_repository.dart';
import 'onboarding_state.dart';

class OnboardingNotifier extends Notifier<OnboardingState> {
  late final OnboardingRepository _repository;

  @override
  OnboardingState build() {
    _repository = ref.read(onboardingRepositoryProvider);

    return OnboardingState(
      items: _repository.getItems(),
    );
  }

  void changePage(int index) {
    state = state.copyWith(currentPage: index);
  }

  bool get isLastPage {
    return state.currentPage == state.items.length - 1;
  }
}