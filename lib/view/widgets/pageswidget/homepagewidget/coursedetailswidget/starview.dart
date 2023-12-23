import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../controller/pages/homepagecontroller/coursedetailscontroller/coursedetailsreviewscontroller/makereview_controller.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/sizes.dart';

class Starsview extends StatelessWidget {
  const Starsview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MakereviewController>(
      builder: (controller){
      return Container(
      margin: EdgeInsets.only(top: Sizes.widthtwenty,bottom: Sizes.widthtwenty),
      height: Sizes.widthfifty,
      child: ListView.builder(
        reverse: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.cat.length,
        itemBuilder: (context,i){
          return Container(
            padding: const EdgeInsets.only(bottom: 8,right: 15,left: 15),
            margin: EdgeInsets.only(right: Sizes.widthfifteen),
            height: Sizes.widthfifteen,
            decoration: BoxDecoration(
              color: controller.whentap[i].value ? AppColors.secondary : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.grey)
            ),
            child:InkWell(
              onTap: () {controller.tapcat(i);},
              child: Center(child: Text("${controller.cat[i].toString()} ${'59'.tr}",style: TextStyle(color: controller.whentap[i].value ? AppColors.textWhite :AppColors.black,fontSize: 17.5,fontWeight: FontWeight.w700))))
          );
        })
      ); 
    });
  }
}

class Starsviewtwo extends StatelessWidget {
  const Starsviewtwo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditreviewController>(
      builder: (controller){
      return Container(
      margin: EdgeInsets.only(top: Sizes.widthtwenty,bottom: Sizes.widthtwenty),
      height: Sizes.widthfifty,
      child: ListView.builder(
        //reverse: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.cat.reversed.length,
        itemBuilder: (context,i){
          return Container(
            padding: const EdgeInsets.only(bottom: 8,right: 15,left: 15),
            margin: EdgeInsets.only(right: Sizes.widthfifteen),
            height: Sizes.widthfifteen,
            decoration: BoxDecoration(
              color: controller.whentap[i].value ? AppColors.secondary : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.grey)
            ),
            child:InkWell(
              onTap: () {controller.tapcat(i);},
              child: Center(child: Text("${controller.cat[i].toString()} ${'59'.tr}",style: TextStyle(color: controller.whentap[i].value ? AppColors.textWhite :AppColors.black,fontSize: 17.5,fontWeight: FontWeight.w700))))
          );
        })
      ); 
    });
  }
}