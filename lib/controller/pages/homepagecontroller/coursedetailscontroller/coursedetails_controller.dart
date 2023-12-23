import 'package:get/get.dart';
import '../../../../view/pages/homepage/coursedetails/coursedetailsformation.dart';
import '../../../../view/pages/homepage/coursedetails/coursedetailsregister.dart';
import '../../../../view/pages/homepage/coursedetails/coursedetailsreviews/coursedetailsreviews.dart';

class CoursedetailsController extends GetxController {

  int currentpage = 0;

  whentap(int i ){
    currentpage = i ;
    update();
  }

  List<String> titles = [
    '43'.tr,'44'.tr,'45'.tr
  ];

  List pages = [
    const CourseDetailsFormation(),
    const CourseDetailsRegister(),
    const CourseDetailsReviews()
  ];

}