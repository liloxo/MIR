import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/core/constants/savedvalues.dart';
import 'package:mir/core/class/cities.dart';
import 'package:path/path.dart';
import '../../../core/constants/firebaseinstance.dart';
import '../../../core/services/services.dart';


class PersonalinfoController extends GetxController{

  RxString status = '18'.tr.obs;
  late String? selectedCity ;
  late String fullname;
  late TextEditingController fullnamecontroller ;
  GlobalKey<FormState> globalKey = GlobalKey();
  MyServices myServices = Get.find();
  String? cityVal;
  File? myfile;
  CollectionReference<Map<String, dynamic>> firebasefirestore = FirebaseFirestore.instance.collection('users');
  String? image;

  sourceimage()async{
    XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    Reference firebaseStorage = FirebaseStorage.instance.ref('users');
    String? imageurl;
    if(xFile != null){
     myfile = File(xFile.path);
     String imagename = basename(xFile.path);
     TaskSnapshot uploadTask = await firebaseStorage.child(imagename).putFile(myfile!);
     imageurl = await uploadTask.ref.getDownloadURL();
     await firebasefirestore.doc(SavedValues.id).update({
      'imageurl': imageurl
     });
     var daa = await FirebaseInstances.firebaseFirestore.collection('formations').where('userid',isEqualTo: SavedValues.id).get();
     for (var i in daa.docs) {
      await FirebaseInstances.firebaseFirestore.collection('formations').doc(i.id).update({'imageurl':imageurl});
     }
     update();
    }
  }

  savesharedpref(){
    Get.back();
    myServices.sharedPreferences.setString('fullname', fullnamecontroller.text);
  }

  saveinfo() async {
    if(globalKey.currentState!.validate()){
      if(fullnamecontroller.text == fullname && cityVal == null){
        return null;
      }else{
        await firebasefirestore.doc(SavedValues.id).update({
          'username': fullnamecontroller.text,
        });
        if(cityVal != null){
          myServices.sharedPreferences.setString('city',  cityVal!);
          await firebasefirestore.doc(SavedValues.id).update({
          'city': cityVal,
        });
        }
        savesharedpref();
      }
    }
  }

  TextStyle statusstyle(String rxString,String field){
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
        changeval(value);
        cityVal = value;
      }
    });
    update();
  }

  changeval(String newval){
    selectedCity = newval;
    update();
  }

  @override
  void onInit() {
    fullname = myServices.sharedPreferences.getString('fullname')!;
    selectedCity = myServices.sharedPreferences.getString('city') ?? '16'.tr;
    fullnamecontroller = TextEditingController(text: fullname);
    image = Get.arguments['image'];
    super.onInit();
  }
  
}