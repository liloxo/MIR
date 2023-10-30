import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        bottomNavigationBar: CustomNavigationBar(index: controller.currentpage,onTap: (value) {controller.changepage(value);}),
        body: Container(
          child: controller.pages.elementAt(controller.currentpage)
        )
      )
    );
  }
}