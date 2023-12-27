import 'package:flutter/material.dart';
import 'package:mir/core/constants/colors.dart';

class LongTextField extends StatelessWidget {
  final String data;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final int? maxLength;
  final int? maxLines;
  const LongTextField({Key? key, required this.data, this.onChanged, this.controller, this.maxLength, this.maxLines}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
     // validator: validator,
      onChanged: onChanged,
      maxLines: maxLines,
      maxLength: maxLength,
      controller: controller,
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
        label: Text(data,style: const TextStyle(color: Colors.grey,fontSize: 18,fontWeight: FontWeight.w500)),
        //floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIconColor: AppColors.secondary,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
      )
    );
  }
}