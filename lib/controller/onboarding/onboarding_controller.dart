import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/services/services.dart';
import '../../data/model/staticonboarding/onboardingmodel.dart';

class OnBoardingController extends GetxController {

  late PageController pageController;
  MyServices myServices = Get.find() ; 
  int currentPage = 0;

  next() {
    currentPage++;

    if (currentPage > onBoardingList.length - 1) {
      myServices.sharedPreferences.setString("step", "1") ; 
      Get.offAllNamed('signup') ; 
    } else {
      pageController.animateToPage(currentPage,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }

  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}