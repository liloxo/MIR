import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/controller/pages/profilecontroller/personalinfo_controller.dart';

import '../../../core/components/customtextformfield.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/sizes.dart';
import '../../../core/functions/validinput.dart';
import '../../widgets/userdetailswidget/statuscitygesture.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PersonalinfoController controller = Get.put(PersonalinfoController());
    return Scaffold(
      backgroundColor: AppColors.textWhite,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: controller.globalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppSize.height * 0.05),
                IconButton(onPressed: (){Get.back();}, icon: const Icon(Icons.arrow_back,size: 30,color: AppColors.secondary,)),
                Container(
                  margin: const EdgeInsets.only(bottom: 60),
                  alignment: Alignment.center,
                  height: AppSize.height * 0.21,
                  child: InkWell(
                    onTap: () {
                      controller.pickimage();
                    },
                    child: Stack(
                      children: [
                        Image.asset('assets/onboardingtwo.png'),
                        Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.withOpacity(0.7),
                          ),
                          child: const Icon(Icons.add_a_photo,size: 22,color: Colors.white)
                        ))
                      ]
                    ),
                  )
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: AppSize.height / 10,
                  child: CustomTextFormField(
                    valid: (val) {
                      return validInput(val!, 3, 50,null);
                    },
                    mycontroller: controller.fullnamecontroller,
                    labeltext: '13'.tr,suffixIcon: const Icon(Icons.person,color: AppColors.secondary), enabled: true),
                ),
                Obx(() => 
                StatusCityGesture(
                  field: controller.status.value,
                  icon: Icons.arrow_drop_down,
                  style: const TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.w500,letterSpacing: 1),
                  onTap: null)
                ),
                Obx(() => 
                StatusCityGesture(
                  field: controller.selectedCity!.value,
                  icon: Icons.location_city,
                  style: controller.statusstyle('16'.tr.obs,controller.selectedCity!),
                  onTap: () {
                   controller.citytap(context);
                  })
                ),
                Container(
                  alignment: Alignment.center,
                  child: 
                    GestureDetector(
                      onTap: () {
                        controller.saveinfo();
                      },
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        width: AppSize.width / 3,
                        height: AppSize.height * 0.08,
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child:  Center(child: Text('22'.tr,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: AppColors.textWhite,letterSpacing: 1))),
                      ),
                    )
                )
              ]
            ),
          )
        )
      )
    );
  }
}