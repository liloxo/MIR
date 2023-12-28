import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/core/class/cities.dart';
import 'package:mir/core/constants/firebaseinstance.dart';
import 'package:mir/core/constants/savedvalues.dart';

import '../../../core/functions/translatestring.dart';
import '../../../data/model/homepage/formationmodel.dart';

class AddformationController extends GetxController {

  String cat  = '79'.tr;
  String city = '80'.tr;
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController groupes = TextEditingController();
  int? groupesnum;
  List nums = [];
  bool iscreate = false;
  List<GroupController> groupControllers = [];
  Map<String, dynamic>? jsonData;
  String? forid;

  getback(){
    iscreate = false;
    nums.clear();
    groupControllers.clear();
    update();
  }
 
  selecttap(BuildContext context){
    showMenu(
      context: context,
      position: RelativeRect.fill,
      items: cats.map((ctg) {
        return PopupMenuItem<String>(
          value: ctg,
          child: Text(ctg,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500)),
        );
      }).toList(),
    ).then((value) {
      if (value != null) {
        cat = value;
        update();
      }
    });
  }
  selectcity(BuildContext context){
    showMenu(
      context: context,
      position: RelativeRect.fill,
      items: cities.map((ctg) {
        return PopupMenuItem<String>(
          value: ctg,
          child: Text(ctg,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500)),
        );
      }).toList(),
    ).then((value) {
      if (value != null) {
        city = value;
        update();
      }
    });
  }
  TextStyle statusstyle(String field, String defaultval){
    if(field == defaultval ){
      return const TextStyle(color: Colors.grey,fontSize: 18,fontWeight: FontWeight.w500,letterSpacing: 1);
    }else{
      return const TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600,letterSpacing: 1);
    }
  }

  create() async {
    if(cat == '79'.tr || city == '80'.tr || title.text.isEmpty || description.text.isEmpty || groupes.text.isEmpty   ){
     Get.defaultDialog(content: Text("88".tr));
     return;
    } if(!groupes.text.isNum){
     Get.defaultDialog(content: Text('89'.tr));
     return;
    }
    else{
      var userdata = await FirebaseInstances.firebaseFirestore.collection('users').doc(SavedValues.id).get();
      String? image = userdata.data()!['imageurl'];
      groupesnum = int.tryParse(groupes.text);
      for (var i = 1; i <= groupesnum! ; i++) {
        groupControllers.add(GroupController());
        nums.add(i);
      }
      iscreate = true;
      update();
      FormationModel formationModel = FormationModel(
      category: translateCategory(cat,'en'),
      categoryar: translateCategory(cat,'ar'),
      categoryfr: translateCategory(cat,'fr'),
      city: city,
      title: title.text,
      description: description.text,
      teacher: SavedValues.username,
      groupes:groupesnum,
      status: 'Available',
      image: image ?? '',
      userid: SavedValues.id,
      favorites: 0
    );
    jsonData = formationModel.toJson();
    }
  }

  storegroupes(String? path,String? price,String? time,int? seats)async{
    for (int i = 0; i < groupControllers.length; i++) {
      await FirebaseInstances.firebaseFirestore.collection('formations').doc(forid).collection('register').doc(path).set({
      'status': 'Available',
      'price': price,
      'duration': time,
      'reserved': 0,
      'seats': seats
    });
    }
  }

  storeformation()async{
    forid = FirebaseInstances.firebaseFirestore.collection('formations').doc().id;
    await FirebaseInstances.firebaseFirestore.collection('formations').doc(forid).set(jsonData!);
  }
}

class GroupController {
  final TextEditingController timeController = TextEditingController();
  final TextEditingController seatsController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  String? status;
  bool isstatus = false;
}