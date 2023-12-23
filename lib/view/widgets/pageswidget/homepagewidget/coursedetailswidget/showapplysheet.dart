import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/components/customtextformfield.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/savedvalues.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/functions/validinput.dart';
import '../../../userdetailswidget/statuscitygesture.dart';
import 'custominkwell.dart';

showapplysheet(void Function()? onTap){
    Get.bottomSheet(
      Container(
        margin: const EdgeInsets.all(15),
        height: AppSize.height/2,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: Sizes.widthfifty),
              height: AppSize.height / 10,
              child: CustomTextFormField(
                valid: (val) {
                  return validInput(val!, 3, 50,null);
                },
                mycontroller: TextEditingController(text: SavedValues.username),
                labeltext: '13'.tr,suffixIcon: const Icon(Icons.person,color: AppColors.secondary), enabled: true),
            ),
            StatusCityGesture(onTap: null,field: SavedValues.email,style: const TextStyle(color: AppColors.grey,fontSize: 17.5,letterSpacing: 1.5),icon: Icons.email_outlined),
            SizedBox(height: Sizes.widthtwentyfive,),
            CustomInkWell(
              selected:  true ,
              data: '58'.tr, 
              onTap: onTap)
          ],
        ),
      ),
      backgroundColor: AppColors.textWhite
    );
  }