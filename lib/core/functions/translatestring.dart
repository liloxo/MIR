import 'package:get/get.dart';
import '../services/services.dart';

translateDatabase(ar, en,fr) {
  MyServices myServices = Get.find();
  String? lang = myServices.sharedPreferences.getString("lang");
  if ( lang  == "ar") {
    return ar;
  } if(lang == 'fr'){
   return fr;
  }
  else {
    return en;
  }
}

String translatestat(String status){
  if(status == 'Teacher' ||status == 'Enseignant' || status == 'أستاذ'){
    return 'teacher';
  }else{
    return 'student';
  }
}

translatecat() {
  MyServices myServices = Get.find();
  String? lang = myServices.sharedPreferences.getString("lang");
  if ( lang  == "ar") {
    return 'categoryar';
  } if(lang == 'fr'){
   return 'categoryfr';
  }
  else {
    return 'category';
  }
}

String translateCategory(String category, String targetLanguage) {
  Map<String, Map<String, String>> categoryTranslations = {
  'Math': {'ar': 'رياضيات', 'fr': 'Mathématiques'},
  'Mathématiques': {'ar': 'رياضيات', 'en': 'Math'},
  'رياضيات': {'fr': 'Mathématiques', 'en': 'Math'},
  'Science': {'ar': 'علوم', 'fr': 'Sciences'},
  'Sciences': {'ar': 'علوم', 'en': 'Science'},
  'علوم': {'fr': 'Sciences', 'en': 'Science'},
  'Physics': {'ar': 'فيزياء', 'fr': 'Physique'},
  'Physique': {'ar': 'فيزياء', 'en': 'Physics'},
  'فيزياء': {'fr': 'Physique', 'en': 'Physics'},
  'Economy': {'ar': 'اقتصاد', 'fr': 'Économie'},
  'Économie': {'ar': 'اقتصاد', 'en': 'Economy'},
  'اقتصاد': {'en': 'Economy', 'fr': 'Économie'},
  'Technology': {'ar': 'تكنولوجيا', 'fr': 'Technologie'},
  'Technologie': {'ar': 'تكنولوجيا', 'en': 'Technology'},
  'تكنولوجيا': {'fr': 'Technologie', 'en': 'Technology'},
  'History': {'ar': 'تاريخ', 'fr': 'Histoire'},
  'Histoire': {'ar': 'تاريخ', 'en': 'History'},
  'تاريخ': {'fr': 'Histoire', 'en': 'History'},
  'Computer Science': {'ar': 'علوم الحاسوب', 'fr': 'Informatique'},
  'Informatique': {'ar': 'علوم الحاسوب', 'en': 'Computer Science'},
  'علوم الحاسوب': {'fr': 'Informatique', 'en': 'Computer Science'},
  'Other': {'ar': 'آخر', 'fr': 'Autre'},
  'Autre': {'ar': 'آخر', 'en': 'Other'},
  'آخر': {'fr': 'Autre', 'en': 'Other'},
};
  if (categoryTranslations.containsKey(category)) {
    Map<String, String> translations = categoryTranslations[category]!;
    if (translations.containsKey(targetLanguage)) {
      return translations[targetLanguage]!;
    }
  }
  return category;
} 

String translatestatus(String status, String targetLanguage) {
  Map<String, Map<String, String>> categoryTranslations = {
  'Available': {'ar': 'متاح', 'fr': 'Disponible'},
  'Disponible': {'ar': 'متاح', 'en': 'Available'},
  'متاح': {'en': 'Available', 'fr': 'Disponible'},
  'Closed': {'ar': 'مغلق', 'fr': 'Fermé'},
  'Fermé': {'en': 'Closed', 'ar': 'مغلق'},
  'مغلق': {'en': 'Closed', 'fr': 'Fermé'},
  };
  if (categoryTranslations.containsKey(status)) {
    Map<String, String> translations = categoryTranslations[status]!;
    if (translations.containsKey(targetLanguage)) {
      return translations[targetLanguage]!;
    }
  }
  return status;
} 

