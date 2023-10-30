import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/services/services.dart';

class HomepageController extends GetxController {

  late String fullname;
  MyServices myServices = Get.find();
  List<RxBool> whentap = [];
  bool issearch = false;
  bool isloading = false;
  TextEditingController textEditingController = TextEditingController();

  searchchange(String? value){
     if(value == "" || value!.isEmpty){
      isloading = false;
      issearch = false;
      update();
    }else{
     isloading = true;
    update();
    Future.delayed(const Duration(seconds: 2)).whenComplete(() {
      isloading = false;
    issearch = true;
    update();
    });
    }
  }

  List cat = [
    'Math','Science','Physics','Marketing','Technology','History',
  ];

  void tapcat(int i) {
    if(whentap[i].value == true){
      whentap[i].value = false;
    }else{
      for (var element in whentap) {element.value = false; }
      whentap[i].value = !whentap[i].value;
    }
    update();
  }

  @override
  void onInit() {
    fullname = myServices.sharedPreferences.getString('fullname')!;
    whentap = List<RxBool>.generate(cat.length, (index) => false.obs);
    super.onInit();
  }
}