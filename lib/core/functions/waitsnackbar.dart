import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/core/constants/colors.dart';

showsnack(){
  Get.showSnackbar(const GetSnackBar(
      backgroundColor: Colors.grey,
      messageText: Center(child: Text('Please Wait',textAlign: TextAlign.center,style: TextStyle(fontSize: 17,color: AppColors.background),)),
      padding: EdgeInsets.fromLTRB(5, 5, 5, 8),
      margin: EdgeInsets.symmetric(horizontal: 130,vertical: 15),
      borderRadius: 15,
    ));
}