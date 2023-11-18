import 'package:get/get.dart';
import '../services/services.dart';

class SavedValues {

  static MyServices myServices = Get.find();
  static String id = myServices.sharedPreferences.getString('id')!;
}