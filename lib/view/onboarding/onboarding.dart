import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/controller/onboarding/onboarding_controller.dart';
import 'package:mir/core/constants/colors.dart';
import '../widgets/onboardingwidget/custombutton.dart';
import '../widgets/onboardingwidget/customslider.dart';
import '../widgets/onboardingwidget/dotcontroller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingController()) ;
    return Scaffold(
        backgroundColor: AppColors.textWhite,
        body: SafeArea(
          child: Column(children: [
             const Expanded(
              flex: 4,
              child: CustomSliderOnBoarding(),
            ),
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    CustomDotControllerOnBoarding(),
                    SizedBox(width: 15),
                    CustomButtonOnBoarding()
                  ],
                ))
          ]),
        ));
  }
}