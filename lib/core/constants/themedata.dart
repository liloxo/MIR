import 'package:flutter/material.dart';
import 'package:mir/core/constants/colors.dart';

ThemeData themeEnglish = ThemeData(
  textTheme:  const TextTheme(
    displayLarge: TextStyle(fontSize: 26,fontWeight: FontWeight.w600,color: AppColors.black,letterSpacing: 1),

    displayMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: AppColors.black),
    
    bodyLarge:  TextStyle(fontSize: 18,color: AppColors.grey,fontWeight: FontWeight.w600),

    bodyMedium: TextStyle(height: 2, color: AppColors.grey, fontSize: 14)),

);