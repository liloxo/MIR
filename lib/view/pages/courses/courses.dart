import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/sizes.dart';

class Courses extends StatelessWidget {
  const Courses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('49'.tr,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w600,color: AppColors.secondary)),
              //const Text('You have not registered in any course yet',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: AppColors.grey),textAlign: TextAlign.center,),
              SizedBox(
                height: AppSize.height / 2,
                width: double.infinity,
                child: Image.asset('assets/nocourses.png'))
            ]
          )
        )
      )
    );
  }
}