import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';

class SearchField extends StatelessWidget {
  final void Function(String)? onChanged;
  const SearchField({Key? key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      cursorColor: AppColors.secondary,
      style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500,letterSpacing: 1),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 2.2,
            color: AppColors.third
          )
        ),
        hintText: '21'.tr, 
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}