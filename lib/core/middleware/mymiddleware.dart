import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/services.dart';

class MyMiddleWare extends GetMiddleware {
  MyServices myServices = Get.find();
  

  @override
  RouteSettings? redirect(String? route) {
    String? step = myServices.sharedPreferences.getString("step") ;
    if (step == "1") {
      return const RouteSettings(name: 'signup');
    }
    if (step == "2") {
      return const RouteSettings(name: 'userdetails');
    }if(step == "3"){
      return const RouteSettings(name: 'home');
    }
    
    return null;
  }
}