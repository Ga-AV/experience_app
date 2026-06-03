import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/onboarding_item.dart';

part 'onboarding_state.freezed.dart';

@freezed
abstract class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    @Default([]) List<OnboardingItem> items,
    @Default(0) int currentPage,
  }) = _OnboardingState;
}