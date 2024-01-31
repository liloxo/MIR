import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/controller/onboarding/onboarding_controller.dart';
import 'package:mir/core/constants/colors.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingController> {
  const CustomButtonOnBoarding({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.next();
      },
      child: Container(
       decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(60)
       ),
        height: 45,
        width: 65,
        child: const Center(
          child: Icon(Icons.arrow_forward_ios,color: AppColors.textWhite,size: 20)
        )
      )
    );
  }
}