import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/sizes.dart';
import '../../../core/functions/validinput.dart';

class PhoneNumberRow extends StatelessWidget {
  final TextEditingController? textcontroller;
  const PhoneNumberRow({super.key, this.textcontroller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      height: 100,
      child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.only(top: 5),
                height: 60,
                width: 80,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey,width: 1),
                  borderRadius: BorderRadius.circular(25)
                ),
                child: const Text('+213',style: TextStyle(color: AppColors.black,fontSize: 19,fontWeight: FontWeight.w500),textAlign: TextAlign.center)
              ),
              SizedBox(
                width: AppSize.width * 0.6,
                height: 100,
                child: TextFormField(
                  style: const TextStyle(fontSize: 18,letterSpacing: 2,fontWeight: FontWeight.w500),
                  controller: textcontroller,
                  validator: (val) {
                    return validInput(val!, 9, 9, 'phone');
                  },
                  keyboardType: TextInputType.number,
                  cursorColor: AppColors.secondary,
                  decoration: InputDecoration(
                    errorStyle: const TextStyle(fontSize: 13),
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(color: AppColors.secondary,width: 1)
                    ),
                    focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: const BorderSide(color: AppColors.secondary,width: 2)
                    )
                  )
                )
              )
        ]
      )
    );
  }
}