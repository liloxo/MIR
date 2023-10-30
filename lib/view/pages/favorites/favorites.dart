import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/core/constants/colors.dart';
import 'package:mir/core/constants/sizes.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('48'.tr,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w600,color: AppColors.secondary)),
              SizedBox(
                height: AppSize.height / 2,
                width: double.infinity,
                child: Image.asset('assets/nofavorites.png')),
              
            ],
          ),
        ),
      ),
    );
  }
}