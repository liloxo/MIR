import 'package:get/get.dart';

class CoursedetailsRegisterController extends GetxController {
   
  List<bool> whentap = [];

  void opengroupe(int i) {
    whentap[i] = !whentap[i];
    update();
  }

  @override
  void onInit() {
    whentap = List<bool>.generate(5, (index) => false);
    super.onInit();
  }

}