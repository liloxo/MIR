import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/controller/pages/homepagecontroller/coursedetailscontroller/coursedetails_controller.dart';
import 'package:mir/core/constants/sizes.dart';
import '../../../widgets/pageswidget/homepagewidget/coursedetailswidget/customtabbar.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CoursedetailsController());
    return GetBuilder<CoursedetailsController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          SizedBox(height: Sizes.widthfifty),
          const CustomTabBar(),
          Expanded(child: controller.pages.elementAt(controller.currentpage))
        ]));
    }); 
  }
}
