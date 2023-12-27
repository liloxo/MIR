import 'package:get/get.dart';
import 'package:mir/view/pages/formations/formationpages/formationstudents/formationrequests.dart';
import '../../../../data/model/homepage/formationmodel.dart';
import '../../../../view/pages/formations/formationpages/formationstudents/formationreserved.dart';

class FormationstudentsController extends GetxController {

  late FormationModel formationmodel;
  int currentpage = 0;

  whenselect(int i ){
    currentpage = i ;
    update();
  }

  List<String> titles = [
    '61'.tr,'93'.tr,
  ];

  List pages = [
    const FormationReserved(),
    const FormationRequests(),
  ];
 
  @override
  void onInit() {
    formationmodel = Get.arguments['formationmodel'];
    super.onInit();
  }
}

