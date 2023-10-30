import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:mir/controller/phonemethod/phonemethod_controller.dart';
import 'package:mir/core/constants/colors.dart';
import '../widgets/phonemethodwidget/phonemethodtop.dart';
import '../widgets/phonemethodwidget/phonenumberrow.dart';

class PhoneMethod extends StatelessWidget {
  const PhoneMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PhonemethodController controller = Get.put(PhonemethodController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: Form(
            key: controller.key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const PhoneMethodTop(),
                const Text('Phone Number',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: AppColors.black)),
                const PhoneNumberRow(),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      controller.checknumber();
                    },
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      alignment: Alignment.center,
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color: AppColors.third,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: const Text('Confirm',style: TextStyle(color: AppColors.textWhite,fontSize: 18,fontWeight: FontWeight.w500))
                    )
                  )
                ),
                Center(
                  child: OtpTextField(
                  cursorColor: AppColors.secondary,
                  margin: const EdgeInsets.only(bottom: 25,right: 10,left: 10,top: 20),
                  numberOfFields: 5,
                  borderColor: AppColors.secondary,
                  focusedBorderColor: AppColors.third,
                  borderRadius: BorderRadius.circular(12),
                  showFieldAsBox: true, 
                  onSubmit: (String verificationCode){
                  } 
                )
            ),
              ]
            ),
          )
        )
      )
    );
  }
}