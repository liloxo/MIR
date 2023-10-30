import 'package:get/get.dart';

validInput(String val, int? min, int? max, String? type) {

  if (val.isEmpty) {
    return "23".tr;
  }else{
    if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Unvalid Number";
    }
   }
   if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "not valid email";
    }
   }
  }

  if (val.length < min!) {
    return "${'24'.tr} $min" ;//  "can't be less than $min";
  }

  if (val.length > max!) {
    return "${'25'.tr} $max";// "can't be larger than $max";
  }
}