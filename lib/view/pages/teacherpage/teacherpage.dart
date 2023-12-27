import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/controller/pages/teacherpagecontroller/teacherpage_controller.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/sizes.dart';
import '../../widgets/pageswidget/homepagewidget/coursedetailswidget/custominkwell.dart';

class TeacherPage extends StatelessWidget {
  const TeacherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TeacherpageController());
    return GetBuilder<TeacherpageController>(
      builder: (controller){
      return Scaffold(
      body: Column(
        children: [
          SizedBox(height: Sizes.widthtwentyfive),
          const Customteacherbar(),
          Expanded(child: controller.pages.elementAt(controller.currentpage))
        ],
      ),
    );
    });
  }
}

class Customteacherbar extends StatelessWidget {
  const Customteacherbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeacherpageController>(
      builder: (controller){
      return Container(
        padding: EdgeInsets.symmetric(vertical: Sizes.widthfifteen,horizontal: Sizes.widthtwentyfive),
        margin: EdgeInsets.only(top: Sizes.widthfifteen,right: Sizes.widthfifteen,left: Sizes.widthfifteen),
        height: AppSize.width / 4,
        decoration: BoxDecoration(
    color: AppColors.background,
    borderRadius: BorderRadius.circular(30)
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (BuildContext context, int i) { 
                  return SizedBox(
              width: AppSize.width / 2.6,
              child: CustomInkWell(
                selected: controller.currentpage == i ? true : false,
                data: controller.titles[i],
                onTap: () => controller.whentap(i)
              ),
                  );
                }, 
              ),
            ),
          ],
        )
      );
    });
  }
}