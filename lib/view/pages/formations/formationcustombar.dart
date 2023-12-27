import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/pages/formationscontroller/formationdetails_controller.dart';
import '../../../controller/pages/formationscontroller/formationpages/formationstudents_controller.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/sizes.dart';
import '../../widgets/pageswidget/homepagewidget/coursedetailswidget/custominkwell.dart';

class CustomFormationBar extends StatelessWidget {
  const CustomFormationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FormationdetailsController());
    return GetBuilder<FormationdetailsController>(
      builder: (controller){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: Sizes.widthtwenty,vertical: Sizes.widthfifteen),
        margin: EdgeInsets.only(top: Sizes.widthfifteen,right: Sizes.widthfifteen,left: Sizes.widthfifteen),
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

class CustomRequestsBar extends StatelessWidget {
  const CustomRequestsBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FormationstudentsController());
    return GetBuilder<FormationstudentsController>(
      builder: (controller){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: Sizes.widthtwenty,vertical: Sizes.widthfifteen),
        margin: EdgeInsets.only(top: 0,right: Sizes.widthfifteen,left: Sizes.widthfifteen),
        height: AppSize.width / 4.5,
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(30)
        ),
        child: Container(
          margin: EdgeInsets.only(left: Sizes.widthtwenty),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 2,
            itemBuilder: (BuildContext context, int i) { 
              return Center(
                child: CustomInkWell(
                  data: controller.titles[i], 
                  selected: controller.currentpage == i ? true : false,
                  onTap: () => controller.whenselect(i),
                )
              );
            }, separatorBuilder: (BuildContext context, int index) { return SizedBox(width: Sizes.widthfifty);} 
          )
        )
      );
     }
    );
  }
}