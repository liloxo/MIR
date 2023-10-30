import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/colors.dart';
import '../../../core/localization/locale.dart';

chooselang(BuildContext context){
  Get.defaultDialog(
    title: 'Choose language',
    titlePadding: const EdgeInsets.only(top: 20),
    titleStyle: Theme.of(context).textTheme.bodyLarge,
    middleText: '',
    content: SizedBox(
      height: 220,
      child: GetBuilder<LocaleController>(
        init: LocaleController(),
        builder: (localeController){
          return Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 25,bottom: 40),
            decoration: localeController.language == const Locale("en") ? BoxDecoration(
              border: Border.all(color: AppColors.secondary),
              borderRadius: BorderRadius.circular(20)
            ): null,
            height: 50,
            width: 100,
            child: InkWell(
              onTap: () {
                localeController.changeLang('en');
              },
              child: const Center(child: Text('English',style: TextStyle(color: AppColors.secondary,fontSize: 18,fontWeight: FontWeight.w500,letterSpacing: 1),))),
          ),
          InkWell(
            onTap: () {
              localeController.changeLang('ar');
            },
            child: Container(
              height: 50,
              width: 100,
              decoration: localeController.language == const Locale("ar") ? BoxDecoration(
                border: Border.all(color: AppColors.secondary),
                borderRadius: BorderRadius.circular(20)
              ): null,
              child: const Center(child:  Text('العربية',style: TextStyle(color: AppColors.secondary,fontSize: 18,fontWeight: FontWeight.w500,letterSpacing: 1)))
            )
          )
        ]
      );
        }
      )
    )
  );
}