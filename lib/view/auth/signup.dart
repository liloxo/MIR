import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/controller/auth/signup_controller.dart';
import 'package:mir/core/class/handlingdataview.dart';
import 'package:mir/core/constants/colors.dart';
import '../../core/constants/sizes.dart';
import '../widgets/methodcontainer.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignupController());
    return Scaffold(
     backgroundColor: AppColors.textWhite,
     body: GetBuilder<SignupController>(
      builder: (controller){
      return HandlingDataView(
        statusRequest: controller.statusRequest, 
        nodatawidget: null, 
        loading: const Center(child: CircularProgressIndicator(strokeWidth: 7,color: AppColors.secondary)),
        widget: SingleChildScrollView(
       child: Column(
        children: [
          SizedBox(height: AppSize.height / 10),
          Center(
            child: SizedBox(
              height: AppSize.height * 0.45,
              child: Image.asset(
                "assets/onboardingone.png",
                fit: BoxFit.fitWidth
              )
            )
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Text('2'.tr,style: Theme.of(context).textTheme.displayLarge)
          ]),
          MethodContainer(
            onPressed: () {
              controller.signIn();
            }
          )
        ]
       )
     ), 
        );
     })
    );
  }
}