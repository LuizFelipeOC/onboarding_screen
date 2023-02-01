import 'package:flutter/material.dart';
import 'package:onboarding/src/core/shared/app_images.dart';
import 'package:onboarding/src/features/onboarding/model/onboarding_items_models.dart';

class OnboardingController extends ValueNotifier<int> {
  OnboardingController(super.value);

  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  List<OnboardingItemsModels> items = [
    OnboardingItemsModels(
      pathIamge: AppImages.icon1,
      title: "Manage your tasks",
      subtitle:
          "You can easily manage all of your daily tasks in DoMe for free",
    ),
    OnboardingItemsModels(
      pathIamge: AppImages.icon2,
      title: "Create daily routine",
      subtitle:
          "In Uptodo  you can create your personalized routine to stay productive",
    ),
    OnboardingItemsModels(
      pathIamge: AppImages.icon3,
      title: "Orgonaize your tasks",
      subtitle:
          "You can organize your daily tasks by adding your tasks into separate categories",
    )
  ];

  void chagendPage(int index) {
    value = index;
    return;
  }

  void nextPage() {
    pageController.nextPage(
      duration: const Duration(
        milliseconds: 300,
      ),
      curve: Curves.ease,
    );
  }

  void backPage() {
    pageController.nextPage(
      duration: const Duration(
        milliseconds: 300,
      ),
      curve: Curves.ease,
    );
  }
}
