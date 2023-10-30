
import 'package:get/get.dart';

class OnBoardingstatic {
  String title;
  String content;
  String image;
  OnBoardingstatic({required this.title,required this.content,required this.image});
}

List<OnBoardingstatic> onBoardingList = [
  OnBoardingstatic(title: '10'.tr,  content: 'a'.tr, image: 'assets/onboardingone.png'),
  OnBoardingstatic(title: '8'.tr, content: 'b'.tr,   image: 'assets/onboardingthree.png'),
  OnBoardingstatic(title: "11".tr, content: 'c'.tr, image: 'assets/onboardingtwo.png')
]; 