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
          margin: const EdgeInsets.only(right: 5),
          height: Sizes.widthsixty,
          width: AppSize.width / 3.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(27),
            color: selected ? AppColors.secondary : AppColors.background
          ),
          child: Center(
            child: SingleChildScrollView(scrollDirection: Axis.horizontal,child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(data,style: TextStyle(color: selected ? AppColors.textWhite : AppColors.black,fontSize: 15,fontWeight: FontWeight.w500,letterSpacing: 1)),
            )),
          ),
        )
      )
    );
  }
}

class CustomInkWellCancel extends StatelessWidget {
  final void Function()? onTap;
  final String data;
  final bool selected;
  const CustomInkWellCancel({Key? key, this.onTap, required this.data, required this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: selected ? 0.9 : 0.5,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
      child: InkWell(
        onTap:onTap,
        child: Container(
          margin: const EdgeInsets.only(right: 5),
          height: Sizes.widthfifty,
          width: AppSize.width / 3.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(27),
            color: selected ? const Color.fromARGB(255, 177, 46, 37) : AppColors.background
          ),
          child: Center(
            child: SingleChildScrollView(scrollDirection: Axis.horizontal,child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(data,style: TextStyle(color: selected ? AppColors.textWhite : AppColors.black,fontSize: 15,fontWeight: FontWeight.w500,letterSpacing: 1)),
            )),
          ),
        )
      )
    );
  }
}