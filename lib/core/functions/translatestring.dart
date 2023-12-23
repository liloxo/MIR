import 'package:get/get.dart';

import '../services/services.dart';

translateDatabase(ar, en,fr) {
  MyServices myServices = Get.find();
  String lang = myServices.sharedPreferences.getString("lang")!;
  if ( lang  == "ar") {
    return ar;
  } if(lang == 'fr'){
   return fr;
  }
  else {
    return en;
  }
}

translatecat() {
  MyServices myServices = Get.find();
  String lang = myServices.sharedPreferences.getString("lang")!;
  if ( lang  == "ar") {
    return 'categoryar';
  } if(lang == 'fr'){
   return 'categoryfr';
  }
  else {
    return 'category';
  }
}