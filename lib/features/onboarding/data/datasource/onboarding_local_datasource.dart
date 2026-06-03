import '../../domain/entities/onboarding_item.dart';
import '../../domain/repositories/onboarding_repository.dart';

class OnboardingLocalDatasource implements OnboardingRepository {
  @override
  List<OnboardingItem> getItems() {
    return const [
      OnboardingItem(
        title: "Create a prototype in just a few minutes",
        subtitle:
            "Enjoy these pre-made components and worry only about creating the best product ever.",
        image: "assets/onboarding.png",
      ),
      OnboardingItem(
        title: "Create a prototype",
        subtitle: "Build apps quickly and easily.",
        image: "assets/onboarding.png",
      ),
      OnboardingItem(
        title: "Launch your app",
        subtitle: "Ship your ideas.",
        image: "assets/onboarding.png",
      ),
    ];
  }
}