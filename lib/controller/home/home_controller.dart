import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/view/pages/favorites/favorites.dart';
import 'package:mir/view/pages/courses/courses.dart';
import 'package:mir/view/pages/messages/messages.dart';
import 'package:mir/view/pages/profile/profile.dart';
import '../../view/pages/homepage/homepage.dart';

class HomeController extends GetxController {

  int currentpage = 0;

  changepage(int i){
  currentpage = i;
  update();
  }
  
  List<Widget> pages = [
  const HomePage(),
  const Favorites(),
  const Courses(),
  const Messages(),
  const Profile(),
  ];

}