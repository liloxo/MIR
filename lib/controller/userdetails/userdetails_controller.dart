import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/core/class/cities.dart';
import '../../core/services/services.dart';
import '../../view/widgets/userdetailswidget/statusdefault.dart';

class UserdetailsController extends GetxController{

  RxString status = '15'.tr.obs;
  RxString? selectedCity = '16'.tr.obs;
  TextEditingController fullnamecontroller = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey();
  MyServices myServices = Get.find();
  String? cityVal;
  late String id;
  CollectionReference<Map<String, dynamic>> firebasefirestore = FirebaseFirestore.instance.collection('users');

  cityval(){
    cityVal = selectedCity!.value;
    return cityVal;
  }

  saveinfo() async {
    if(globalKey.currentState!.validate()){
      if(status == '15'.tr.obs ){
        Get.defaultDialog(
          middleText: 'You Have To Choose Status'
        );
      }else{
        myServices.sharedPreferences.setString('step', '3');
        myServices.sharedPreferences.setString('fullname', fullnamecontroller.text);
        await firebasefirestore.doc(id).update({
          'username': fullnamecontroller.text,
          'status':status.value
        });
        Get.offAllNamed('home');
        if(selectedCity != '16'.tr.obs){
         myServices.sharedPreferences.setString('city', cityval());
         await firebasefirestore.doc(id).update({
          'city': cityval()
        });
        }
      }
    }
  }

  TextStyle statusstyle(RxString rxString,RxString field){
    if(field == rxString  ){
      return const TextStyle(color: Colors.grey,fontSize: 18,fontWeight: FontWeight.w500,letterSpacing: 1);
    }else{
      return const TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600,letterSpacing: 1);
    }
  }

  citytap(BuildContext context){
    showMenu(
      context: context,
      position: RelativeRect.fill,
      items: cities.map((city) {
        return PopupMenuItem<String>(
          value: city,
          child: Text(city,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500)),
        );
      }).toList(),
    ).then((value) {
      if (value != null) {
        changeval(value,selectedCity!);
      }
    });
  }

  changeval(String newval,RxString rxString){
    rxString.value = newval;
    Get.back();
    update();
  }

  statustap(){
    statusdefault(
      () {changeval('18'.tr,status);},
      () {changeval('19'.tr,status);});
  }
  
  @override
  void onInit() {
    id = myServices.sharedPreferences.getString('id')!;
    super.onInit();
  }
}