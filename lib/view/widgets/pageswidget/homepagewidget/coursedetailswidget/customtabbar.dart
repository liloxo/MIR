import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/core/constants/colors.dart';
import 'package:mir/core/constants/sizes.dart';
import 'package:mir/view/widgets/pageswidget/homepagewidget/coursedetailswidget/custominkwell.dart';
import '../../../../../controller/pages/homepagecontroller/coursedetailscontroller/coursedetails_controller.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CoursedetailsController());
    return GetBuilder<CoursedetailsController>(
      builder: (controller){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: Sizes.widthtwenty,vertical: Sizes.widthfifteen),
        margin: EdgeInsets.symmetric(horizontal: Sizes.widthfifteen,vertical: Sizes.widthfifteen),
        height: AppSize.width / 4,
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(30)
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (BuildContext context, int i) { 
            return CustomInkWell(
                selected: controller.currentpage == i ? true : false,
                data: controller.titles[i],
                onTap: () => controller.whentap(i)
            );
          }, 
        )
      );
     }
    );
  }
}