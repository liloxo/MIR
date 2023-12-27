import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/core/constants/colors.dart';
import 'package:mir/view/widgets/customnavigationbar.dart';
import '../../controller/home/home_controller.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => 
      Scaffold(
        floatingActionButton: controller.status == 'teacher' 
        ? FloatingActionButton(onPressed: (){Get.toNamed('addformation');},backgroundColor: AppColors.secondary, child: const Icon(Icons.add_card))
        : null,
        bottomNavigationBar: CustomNavigationBar(index: controller.currentpage,onTap: (value) {controller.changepage(value);}),
        body: Container(
          child: controller.pages.elementAt(controller.currentpage)
        )
      )
    );
  }
}