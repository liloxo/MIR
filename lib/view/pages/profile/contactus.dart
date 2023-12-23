import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/controller/pages/profilecontroller/contactus_controller.dart';
import 'package:mir/core/components/longtextfield.dart';
import 'package:mir/core/constants/colors.dart';
import 'package:mir/core/constants/sizes.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ContactusController controller = Get.put(ContactusController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondary,
        title: Text('38'.tr,style: const TextStyle(color: AppColors.textWhite,fontSize: 22,fontWeight: FontWeight.w600)),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              SizedBox(
                height: AppSize.height * 0.2 ,
                child: LongTextField(data: '42'.tr,onChanged: (value) {controller.change(value);},controller: controller.textEditingController,)
              ),
              GetBuilder<ContactusController>(
                builder: (controller){
                return  Container(
                margin: const EdgeInsets.only(top: 25),
                alignment: Alignment.center,
                child: 
                  GestureDetector(
                    onTap: controller.isEmpty ? null : () => controller.sendemail(),
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 10),
                      width: AppSize.width / 3.8,
                      height: AppSize.height * 0.06,
                      decoration: BoxDecoration(
                        color: controller.isEmpty ? AppColors.grey : AppColors.secondary,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child:  Center(child: Text('41'.tr,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: AppColors.textWhite,letterSpacing: 1))),
                    )
                  )
              );
              })
            ]
          )
        )
      )
    );
  }
}