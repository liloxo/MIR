import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';

class PhoneMethodTop extends StatelessWidget {
  const PhoneMethodTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 60,bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Almost Done!', style: TextStyle(fontSize: 28,fontWeight: FontWeight.w600,letterSpacing: 1,color: AppColors.black)),
          Text("Enter your phone number and we'll send you a code to activate your account",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400))
        ]
      )
    );
  }
}