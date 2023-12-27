import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/model/homepage/formationmodel.dart';
import '../../../view/pages/formations/formationpages/formationgroupes.dart';
import '../../../view/pages/formations/formationpages/formationinfo.dart';
import '../../../view/pages/formations/formationpages/formationstudents/formationstudents.dart';

class FormationdetailsController extends GetxController {

  late FormationModel formationmodel;
  late TextEditingController texttitle;
  late TextEditingController textdesc;
  int currentpage = 0;

  whentap(int i ){
    currentpage = i ;
    update();
  }

  List<String> titles = [
    '43'.tr,'74'.tr,'95'.tr
  ];

  List pages = [
    const Formationinfo(),
    const FormationGroupes(),
    const FormationStudents()
  ];

  @override
  void onInit() {
    formationmodel = Get.arguments['formationmodel'];
    texttitle = TextEditingController(text: formationmodel.title);
    textdesc = TextEditingController(text: formationmodel.description);
    super.onInit();
  }

}