import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/controller/onboarding/onboarding_controller.dart';
import 'package:mir/core/constants/colors.dart';
import '../../../data/model/staticonboarding/onboardingmodel.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(
        builder: (controller) => Row(
             // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onBoardingList.length,
                    (index) => AnimatedContainer(
                          margin: const EdgeInsets.only(right: 5),
                          duration: const Duration(milliseconds: 200),
                          width: controller.currentPage == index ? 20 : 10,
                          height: 15,
                          decoration: BoxDecoration(
                              color: controller.currentPage == index ? AppColors.secondary : Colors.grey,
                              borderRadius: BorderRadius.circular(10)),
                        ))
              ],
            ));
  }
}