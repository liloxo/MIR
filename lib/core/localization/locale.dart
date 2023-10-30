import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/themedata.dart';
import '../services/services.dart';

class LocaleController extends GetxController {
  
  Locale? language;

  MyServices myServices = Get.find();

  ThemeData appTheme = themeEnglish;

  changeLang(String langcode) {
    language = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    Get.updateLocale(language!);
    update();
    Get.back();
  }

  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
    }else {
      language = const Locale("en");
    }
    super.onInit();
  }
}