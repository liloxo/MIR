import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/core/constants/colors.dart';
import 'package:mir/core/constants/firebaseinstance.dart';
import 'package:mir/core/constants/sizes.dart';
import 'package:mir/data/model/homepage/registermodel.dart';
import '../../../../core/class/statusrequest.dart';
import '../../../../core/constants/savedvalues.dart';
import '../../../../core/functions/checkinternet.dart';

class CoursedetailsRegisterController extends GetxController {
   
  List<bool> whentap = [];
  late String formationid;
  List<RegisterModel> registermodel = [];
  late StatusRequest statusRequest ;
  TextEditingController textEditingController = TextEditingController();
  List<String?> isapplied = [] ;
  List<bool> checkreg = [];

  showdi(int i){
    Get.defaultDialog(
     title: '69'.tr,
     middleText: '',
     content: Container(
      margin: EdgeInsets.symmetric(vertical: Sizes.widthtwenty),
       child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MaterialButton(onPressed: (){Get.back();},color: AppColors.textWhite,child: Text('70'.tr)),
          MaterialButton(onPressed: (){cancelreg(i);},color: AppColors.secondary,child: Text('58'.tr,style: const TextStyle(color: AppColors.textWhite)))
        ]
       )
     )
    );
  }

  cancelreg(int i)async{
    await FirebaseInstances.firebaseFirestore.collection('formations').doc(formationid).collection('register')
    .doc('groupe${i+1}')
    .collection('students').doc(SavedValues.id).delete();
    await FirebaseInstances.firebaseFirestore.collection('courses').doc(SavedValues.id).collection('registeredformations').doc(formationid).delete();
    whentap[i] = !whentap[i];
    Get.back();
    update();
  }

  checkregistration(int i) async {
    checkreg[i] = true; 
    update();
    isapplied[i] = null;
    DocumentSnapshot<Map<String, dynamic>> datacheck = await FirebaseInstances.firebaseFirestore.collection('formations').doc(formationid).collection('register')
    .doc('groupe${i+1}')
    .collection('students').doc(SavedValues.id).get();
    if(!datacheck.exists){
      isapplied[i] = null;
    }else{
      if(datacheck.data()!['reserved'] == false) {
        isapplied[i] = 'pending';
      }else{
        isapplied[i] = 'reserved';
      }
    }
    checkreg[i] = false;
    update();
  }

  apply(int i ) async {
    if(!await checkInternet()){
      internetSnackbar();
      return;
    }else{
      await FirebaseInstances.firebaseFirestore.collection('formations').doc(formationid).collection('register')
    .doc('groupe${i+1}')
    .collection('students').doc(SavedValues.id).set({
      'name': SavedValues.username,
      'email': SavedValues.email,
      'id': SavedValues.id,
      'reserved':false
    });
    await FirebaseInstances.firebaseFirestore.collection('courses').doc(SavedValues.id).collection('registeredformations').doc(formationid).set({
      'formationid':formationid,
      'groupe': i+1,
      'reserved':false
    });
    isapplied[i] = 'pending';
    update();
    Get.back();
    }
  }

  void opengroupe(int i) {
    whentap[i] = !whentap[i];
    update();
  }

  getgroupes()async{
    statusRequest = StatusRequest.loading;
    update();
    QuerySnapshot<Map<String, dynamic>> data = await FirebaseInstances.firebaseFirestore.collection('formations').doc(formationid).collection('register').get();
    if(data.docs.isNotEmpty){
      registermodel = data.docs.map((e) => RegisterModel.fromJson(e.data())).toList();
      whentap = List<bool>.generate(registermodel.length   , (index) => false);
      checkreg = List<bool>.generate(registermodel.length   , (index) => false);
      isapplied = List<String?>.generate(registermodel.length   , (index) => null);
      statusRequest = StatusRequest.success;
    }else{
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void onInit() {
    formationid = Get.arguments['formationid'];
    getgroupes();
    super.onInit();
  }

}