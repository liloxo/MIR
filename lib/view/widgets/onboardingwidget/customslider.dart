import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/controller/onboarding/onboarding_controller.dart';
import 'package:mir/core/constants/colors.dart';
import 'package:mir/core/constants/sizes.dart';

import '../../../data/model/staticonboarding/onboardingmodel.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingController> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChanged(val);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: AppSize.height * 0.07,left: 30,right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(onBoardingList[i].title,style: const TextStyle(fontSize: 30,fontWeight: FontWeight.w700,color: AppColors.secondary,letterSpacing: 1)),
                  const SizedBox(height: 10),
                  SizedBox(
                      width: double.infinity,
                      child: Text(
                        onBoardingList[i].content,
                        style: const TextStyle(fontSize: 18,color: AppColors.third,fontWeight: FontWeight.w500),
                      ))
                    ]
                  )
                ),
                SizedBox(
                  height: AppSize.height * 0.45,
                  child: Image.asset(
                    onBoardingList[i].image,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ));
  }
}