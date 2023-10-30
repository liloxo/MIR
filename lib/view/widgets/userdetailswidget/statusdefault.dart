import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/colors.dart';

statusdefault(void Function()? onTapstat,void Function()? onTaptwo){
  Get.defaultDialog(
      titlePadding: const EdgeInsets.only(top: 20),
      contentPadding: const EdgeInsets.only(top: 20),
      title: '17'.tr,
      titleStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
      middleText: '',
      content: SizedBox(
        height: 130,
        child: Column(
          children: [
            InkWell(
              onTap: onTapstat,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: const Icon(Icons.school,color: AppColors.third)),
                  Text('18'.tr,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600))
                ]
              ),
            ),
            InkWell(
              onTap:onTaptwo ,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: const Icon(Icons.person_pin,color: AppColors.third)
                  ),
                  Text('19'.tr,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600))
                ]
              ),
            )
          ]
        )
      )
    );
}