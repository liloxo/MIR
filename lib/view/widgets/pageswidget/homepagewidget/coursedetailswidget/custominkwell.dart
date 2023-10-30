import 'package:flutter/material.dart';
import 'package:mir/core/constants/colors.dart';
import 'package:mir/core/constants/sizes.dart';

class CustomInkWell extends StatelessWidget {
  final void Function()? onTap;
  final String data;
  final bool selected;
  const CustomInkWell({Key? key, this.onTap, required this.data, required this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: selected ? 1 : 0.5,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
      child: InkWell(
        onTap:onTap,
        child: Container(
          padding: const EdgeInsets.only(bottom: 5),
          height: Sizes.widthsixty,
          width: AppSize.width / 3.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(27),
            color: selected ? AppColors.secondary : AppColors.background
          ),
          child: Center(child: Text(data,style: TextStyle(color: selected ? AppColors.textWhite : AppColors.black,fontSize: 16,fontWeight: FontWeight.w500,letterSpacing: 1))),
        )
      )
    );
  }
}