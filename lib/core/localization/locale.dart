import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/themedata.dart';
import '../services/services.dart';

class LocaleController extends GetxController {
  
  Locale? language;
  String? initlanguage = Get.deviceLocale!.languageCode;

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
    if(sharedPrefLang == null){
      if(initlanguage == 'ar'){
       language = const Locale('ar');
      }if(initlanguage == 'fr'){
       language = const Locale('fr');
      }else{
        language = const Locale('en');
      }
    }
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
    }
    if (sharedPrefLang == "fr") {
      language = const Locale("fr");
    }
    if (sharedPrefLang == "en") {
      language = const Locale("en");
    }
    super.onInit();
  }
}