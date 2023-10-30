import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/controller/pages/profilecontroller/contactus_controller.dart';
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
                child: TextFormField(
                  onChanged: (value) {
                    controller.change(value);
                  },
                  controller: controller.textEditingController,
                  maxLines: 5,
                  style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500,letterSpacing: 1),
                  cursorColor: AppColors.secondary,
                  decoration: InputDecoration(
                    focusColor: AppColors.secondary,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 2.2,
                        color: AppColors.secondary 
                      )
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    label: Text('42'.tr,style: const TextStyle(color: Colors.grey,fontSize: 18,fontWeight: FontWeight.w500)),
                    //floatingLabelBehavior: FloatingLabelBehavior.always,
                    prefixIconColor: AppColors.secondary,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  )
                )
              ),
              Obx(() => 
              Container(
                margin: const EdgeInsets.only(top: 25),
                alignment: Alignment.center,
                child: 
                  GestureDetector(
                    onTap: controller.isEmpty.value ? null : () => controller.sendemail(),
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 10),
                      width: AppSize.width / 3.8,
                      height: AppSize.height * 0.06,
                      decoration: BoxDecoration(
                        color: controller.isEmpty.value ? AppColors.grey : AppColors.secondary,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child:  Center(child: Text('41'.tr,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: AppColors.textWhite,letterSpacing: 1))),
                    )
                  )
              ))
            ]
          )
        )
      )
    );
  }
}