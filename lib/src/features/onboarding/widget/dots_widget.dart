import 'package:flutter/material.dart';
import 'package:onboarding/src/core/shared/app_colors.dart';
import 'package:onboarding/src/features/onboarding/controller/onboarding_controller.dart';

class DotsWidget extends StatelessWidget {
  const DotsWidget({
    super.key,
    required this.store,
    required this.index,
  });

  final OnboardingController store;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: store,
      builder: (BuildContext context, dynamic value, Widget? child) {
        return AnimatedContainer(
          duration: kThemeAnimationDuration,
          margin: const EdgeInsets.only(right: 5),
          height: store.value == index ? 8 : 6,
          width: store.value == index ? 30 : 20,
          decoration: BoxDecoration(
            color:
                store.value == index ? AppColors.primaryColor : AppColors.white,
            borderRadius: BorderRadius.circular(3),
          ),
        );
      },
    );
  }
}
