import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/core/services/services.dart';
import 'package:mir/view/pages/favorites/favorites.dart';
import 'package:mir/view/pages/courses/courses.dart';
import 'package:mir/view/pages/profile/profile.dart';
import '../../view/pages/homepage/homepage.dart';

class HomeController extends GetxController {

  int currentpage = 0;
  MyServices myServices = Get.find();
  String? status;

  changepage(int i){
  currentpage = i;
  update();
  }
  
  List<Widget> pages = [
  const HomePage(),
  const Favorites(),
  const Courses(),
 // const Formations(),
  //const Messages(),
  const Profile(),
  ];
  @override
  void onInit() {
    status = myServices.sharedPreferences.getString('status');
    super.onInit();
  }

}