import 'package:get/get.dart';

import '../../../view/pages/addformation/addformation.dart';
import '../../../view/pages/formations/formations.dart';

class TeacherpageController extends GetxController {

 int currentpage = 0;

  whentap(int i ){
    currentpage = i ;
    update();
  }

  List<String> titles = [
    '78'.tr,'92'.tr
  ];

  List pages = [
    const AddFormation(),
    const Formations(),
  ];

}