import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/core/localization/locale.dart';
import '../../../../controller/pages/homepagecontroller/homepage_controller.dart';
import '../../../../core/components/searchfield.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/sizes.dart';

class TopColumnHome extends GetView<HomepageController> {
  final void Function(String)? onChanged;
  const TopColumnHome({Key? key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        SizedBox(height: AppSize.height * 0.04),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Sizes.widthsixty,
              width: Sizes.widthfifty,
              child: ClipOval(child: Image.asset('assets/logomir.png',fit: BoxFit.cover)),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: Sizes.widthfifteen),
              child: Text("${'27'.tr}, ${controller.fullname}!",style: const TextStyle(fontSize: 24,color: AppColors.third,fontWeight: FontWeight.w700))
            )
          ]
        ),
        GetBuilder<LocaleController>(
          init: LocaleController(),
          builder: (controller){
          return Container(
          margin: EdgeInsets.only(bottom: Sizes.widthtwenty),
          alignment: controller.language == const Locale("ar") ? Alignment.centerRight : Alignment.centerLeft,
          child: Text('29'.tr,style: const TextStyle(fontSize: 22,color: AppColors.secondary,fontWeight: FontWeight.bold)));
        }) ,
        SearchField(onChanged: onChanged)
      ]
    );
  }
}