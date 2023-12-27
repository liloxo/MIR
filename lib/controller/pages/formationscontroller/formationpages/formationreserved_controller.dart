import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/class/statusrequest.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/firebaseinstance.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../data/model/homepage/formationmodel.dart';

class FormationreservedController extends GetxController {

  late FormationModel formationmodel;
  List<bool> whentap = [];
  List<GroupeStudents> groupestudents = [];
  List<StatusRequest> statusRequest = [];

  showdia(int i,String? studentid){
    Get.defaultDialog(
     title: '99'.tr,
     middleText: '',
     content: Container(
      margin: EdgeInsets.symmetric(vertical: Sizes.widthtwenty),
       child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MaterialButton(onPressed: (){Get.back();},color: AppColors.textWhite,child: Text('70'.tr)),
          MaterialButton(onPressed: (){deletestudent(i,studentid);},color: AppColors.secondary,child: Text('58'.tr,style: const TextStyle(color: AppColors.textWhite)))
        ]
       )
     )
    );
  }

  deletestudent(int i,String? studentid)async{
    var formcollect = FirebaseInstances.firebaseFirestore.collection('formations').doc(formationmodel.id).collection('register').doc('groupe$i');
   await formcollect.collection('students').doc(studentid).delete();
   await FirebaseInstances.firebaseFirestore.collection('courses').doc(studentid).collection('registeredformations').doc(formationmodel.id).delete();
   var data = await formcollect.get();
    int? reserv = data.data()!['reserved'];
    await formcollect.update({
      'reserved':reserv! - 1
    });
    groupestudents.removeAt(i);
    if(groupestudents.isEmpty){
     statusRequest[i] = StatusRequest.failure;
    }
    update();
    Get.back();
  }
  
  void opengroupe(int i) {
    whentap[i] == false ? getdata(i) : null;
    whentap[i] = !whentap[i];
    update();
  }

  getdata(int i )async{
    statusRequest[i] = StatusRequest.loading;
    update();
    var data = await FirebaseInstances.firebaseFirestore.collection('formations').doc(formationmodel.id).collection('register').doc('groupe${i+1}')
    .collection('students')
    .where('reserved',isEqualTo: true).get();
    if(data.docs.isEmpty){
      statusRequest[i] = StatusRequest.failure;
      update();
    }else{
      groupestudents = data.docs.map((e) => GroupeStudents.fromJson(e.data())).toList();
      statusRequest[i] = StatusRequest.success;
      update();
    }
  } 

  @override
  void onInit() {
    formationmodel = Get.arguments['formationmodel'];
    whentap = List<bool>.generate(formationmodel.groupes! , (index) => false);
    statusRequest = List<StatusRequest>.generate(formationmodel.groupes! , (index) => StatusRequest.none);
    super.onInit();
  }
 
}

class GroupeStudents {
  String? id;
  String? name;
  String? email;

  GroupeStudents.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }
}