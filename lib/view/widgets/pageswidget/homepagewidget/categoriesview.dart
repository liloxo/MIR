import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/core/constants/sizes.dart';
import '../../../../controller/pages/homepagecontroller/homepage_controller.dart';
import '../../../../core/constants/colors.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomepageController controller = Get.put(HomepageController());
    return Container(
      margin: EdgeInsets.only(top: Sizes.widthtwenty,bottom: Sizes.widthtwenty),
      height: Sizes.widthfifty,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.cat.length,
        itemBuilder: (context,i){
          return InkWell(
            onTap: () {
              controller.tapcat(i);
            },
            child: Obx(() => 
            Container(
              padding: const EdgeInsets.only(bottom: 8,right: 10,left: 10),
              margin: const EdgeInsets.only(right: 15),
              height: Sizes.widthfifteen,
              decoration: BoxDecoration(
                color: controller.whentap[i].value ? AppColors.secondary : AppColors.grey,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Center(child: Text(controller.cat[i],style: const TextStyle(color: AppColors.textWhite,fontSize: 17.5,fontWeight: FontWeight.w500,letterSpacing: 1))),
            ))
          );
      }),
    );
  }
}