import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/core/constants/firebaseinstance.dart';
import '../../../../core/class/cities.dart';
import '../../../../core/functions/translatestring.dart';
import '../../../../data/model/homepage/formationmodel.dart';

class FormationinfoController extends GetxController {
  late FormationModel formationmodel;
  late TextEditingController texttitle;
  late TextEditingController textdesc;
  bool? isstatus;
  String? stats;

  changeswitch(bool value){
   isstatus = value;
   if(value == true){
    formationmodel.status = '46'.tr;
   }else{
    formationmodel.status = '47'.tr;
   }
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
        formationmodel.category = value;
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
        formationmodel.city = value;
        update();
      }
    });
  }
  
  updateformation() async {
  Map<String, dynamic> updateData = {};
  if (formationmodel.category != null) {
    updateData['category'] = translateCategory(formationmodel.category!, 'en');
    updateData['categoryar'] = translateCategory(formationmodel.category!, 'ar');
    updateData['categoryfr'] = translateCategory(formationmodel.category!, 'fr');
  }
  if (formationmodel.city != null) {
    updateData['city'] = formationmodel.city!;
  }
  if (formationmodel.status != null) {
    updateData['status'] = translatestatus(formationmodel.status!,'en');
  }
  if (texttitle.text.isNotEmpty) {
    updateData['title'] = texttitle.text;
  }else{
    Get.defaultDialog(content: Text("88".tr));
    return;
  }
  if (textdesc.text.isNotEmpty) {
    updateData['description'] = textdesc.text;
  }else{
    Get.defaultDialog(content: Text("88".tr));
    return;
  }
  if (updateData.isNotEmpty) {
    await FirebaseInstances.firebaseFirestore
      .collection('formations')
      .doc(formationmodel.id)
      .update(updateData);
    Get.back(); 
  }
}
  
  @override
  void onInit() {
    formationmodel = Get.arguments['formationmodel'];
    isstatus = formationmodel.status == 'Available' ? true : false;
    formationmodel.status = formationmodel.status == 'Available' ? '46'.tr : '47'.tr;
    texttitle = TextEditingController(text: formationmodel.title);
    textdesc = TextEditingController(text: formationmodel.description);
    super.onInit();
  }
}