import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/services/services.dart';

class ContactusController extends GetxController {

 TextEditingController textEditingController = TextEditingController();
 bool isEmpty = true;
 late String email;
 late String fullname;
 MyServices myServices = Get.find();

  void change(String value) {
    isEmpty = value.isEmpty;
    update();
  }


 sendemail(){
  //print(textEditingController.text);
 }

 @override
  void onInit() {
    fullname = myServices.sharedPreferences.getString('fullname')!;
    email  = myServices.sharedPreferences.getString('email')!;
    super.onInit();
  }

}