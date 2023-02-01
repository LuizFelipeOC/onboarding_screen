import 'package:flutter/material.dart';
import 'package:onboarding/src/core/shared/app_colors.dart';
import 'package:onboarding/src/features/onboarding/controller/onboarding_controller.dart';

class ButtonAnimatedWidget extends StatelessWidget {
  const ButtonAnimatedWidget({
    super.key,
    required this.store,
  });

  final OnboardingController store;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: store,
      builder: (BuildContext context, value, Widget? child) {
        return AnimatedContainer(
          duration: kThemeAnimationDuration,
          child: Container(
            alignment: Alignment.topRight,
            height: (store.value == (store.items.length - 1)) ? 56 : 300,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
                backgroundColor: AppColors.primaryColor,
                shape: (store.value == (store.items.length - 1))
                    ? RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                    : const CircleBorder(),
              ),
              onPressed: () {
                if (store.value == (store.items.length - 1)) {
                  store.pageController.jumpTo(1);
                  return;
                }

                store.nextPage();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: (store.value == (store.items.length - 1))
                    ? const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Begin",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Lato',
                          ),
                        ),
                      )
                    : const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 40,
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
