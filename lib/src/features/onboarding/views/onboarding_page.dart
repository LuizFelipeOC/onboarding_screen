import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onboarding/src/core/shared/app_colors.dart';
import 'package:onboarding/src/features/onboarding/controller/onboarding_controller.dart';
import 'package:onboarding/src/features/onboarding/model/onboarding_items_models.dart';
import 'package:onboarding/src/features/onboarding/widget/button_animated_widget.dart';
import 'package:onboarding/src/features/onboarding/widget/dots_widget.dart';
import 'package:onboarding/src/features/onboarding/widget/text_button_widget.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final OnboardingController store = OnboardingController(0);

  @override
  void initState() {
    store.pageController;
    super.initState();
  }

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: TextButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: AppColors.white,
                ),
                onPressed: () {},
                child: TextButtonWidget(
                  color: AppColors.white.withOpacity(0.3),
                  title: 'Skip',
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Center(
              child: PageView.builder(
                controller: store.pageController,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (newPage) {
                  store.value = newPage;
                },
                itemCount: store.items.length,
                itemBuilder: (context, int index) {
                  final OnboardingItemsModels props = store.items[index];

                  return Column(
                    children: [
                      Expanded(
                        child: SvgPicture.asset(props.pathIamge),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          props.title,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Lato',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          props.subtitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.white.withOpacity(0.3),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Lato',
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  store.items.length,
                  (index) => DotsWidget(store: store, index: index),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: ButtonAnimatedWidget(store: store),
            ),
          )
        ],
      ),
    );
  }
}
