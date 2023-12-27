import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/colors.dart';

class CustomNavigationBar extends StatelessWidget {
  final int index;
  final void Function(int)? onTap;
  const CustomNavigationBar({Key? key, required this.index, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10,right: 10,left: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: AppColors.black.withOpacity(0.5),blurRadius: 25,offset: const Offset(8, 20))
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BottomNavigationBar(
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold,letterSpacing: 1),
          selectedItemColor: AppColors.secondary,
          unselectedItemColor: AppColors.grey,
          currentIndex: index,
          onTap: onTap,
          items: [
          BottomNavigationBarItem(icon: const Icon(Icons.home),label: '30'.tr),
          BottomNavigationBarItem(icon: const Icon(Icons.favorite_border_outlined),label: '31'.tr),
          BottomNavigationBarItem(icon: const Icon(Icons.school_outlined),label: '32'.tr),
          //BottomNavigationBarItem(icon: const Icon(Icons.school_sharp),label: '92'.tr),
          //BottomNavigationBarItem(icon: const Icon(Icons.message_outlined),label: '33'.tr),
          BottomNavigationBarItem(icon: const Icon(Icons.person_outlined),label: '34'.tr)
          ]
        )
      )
    );
  }
}