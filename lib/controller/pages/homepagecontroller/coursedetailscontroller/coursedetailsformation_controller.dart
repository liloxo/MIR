import 'package:get/get.dart';

import '../../../../data/model/homepage/formationmodel.dart';

class CoursedetailsFormationController extends GetxController {

  late FormationModel formationmodel;

  @override
  void onInit() {
    formationmodel = Get.arguments['formationmodel'];
    super.onInit();
  }
}