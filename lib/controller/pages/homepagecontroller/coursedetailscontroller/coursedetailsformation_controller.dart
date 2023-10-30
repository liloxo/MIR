import 'package:get/get.dart';

class CoursedetailsFormationController extends GetxController {
  
  String? image;
  String? category;
  String? title;
  String? description;
  String? teacher;

  @override
  void onInit() {
    image = Get.arguments['image'];
    category = Get.arguments['category'];
    title = Get.arguments['title'];
    description = Get.arguments['description'];
    teacher = Get.arguments['teacher'];
    super.onInit();
  }
}