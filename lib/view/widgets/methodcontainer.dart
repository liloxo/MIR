import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/sizes.dart';

class MethodContainer extends StatelessWidget {
  final bool ismethod;
  final void Function()? onPressed;
  const MethodContainer({super.key , this.onPressed, required this.ismethod});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.only(left: 5),
      height: AppSize.height * 0.09,
      margin:  EdgeInsets.symmetric(horizontal: AppSize.width * 0.08,vertical: AppSize.width / 07),
      decoration: BoxDecoration(
        color: AppColors.textWhite,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.grey,width: 1)
      ),
      child: MaterialButton(
      onPressed: onPressed,
      child: 
      Row(
        children:  [
        ismethod 
        ? const Icon(Icons.phone_android,color: AppColors.third) 
        : SizedBox(
          height: 35,
          child: Image.asset('assets/google.jpg',fit: BoxFit.fill)),
        ismethod 
        ? Text('4'.tr,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500,letterSpacing: 1)) 
        : Text('5'.tr,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500,letterSpacing: 1))
        ])
      )
    );
  }
}