import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/data/model/cities/cities.dart';
import '../../../core/services/services.dart';

class PersonalinfoController extends GetxController{

  RxString status = '18'.tr.obs;
  late RxString? selectedCity ;
  late String fullname;
  late TextEditingController fullnamecontroller ;
  GlobalKey<FormState> globalKey = GlobalKey();
  MyServices myServices = Get.find();
  String? cityVal;
  File? myfile;

  sourceimage()async{
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(xFile != null){
     myfile = File(xFile.path);
    }
  }

  pickimage()async{
    sourceimage();
  }

  cityval(){
    if(selectedCity == '16'.tr.obs){
     cityVal = null;
    }else{
      cityVal = selectedCity!.value;
    }
    return cityVal;
  }

  savesharedpref(){
    Get.back();
    myServices.sharedPreferences.setString('fullname', fullnamecontroller.text);
  }

  saveinfo(){
    if(globalKey.currentState!.validate()){
      if(cityVal != null){
        savesharedpref();
        myServices.sharedPreferences.setString('city',  cityval());
      }else{
        savesharedpref();
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
    update();
  }

  @override
  void onInit() {
    fullname = myServices.sharedPreferences.getString('fullname')!;
    String cityval = myServices.sharedPreferences.getString('city') ?? '16'.tr;
    selectedCity  = cityval.obs;
    fullnamecontroller = TextEditingController(text: fullname);
    super.onInit();
  }
  
}