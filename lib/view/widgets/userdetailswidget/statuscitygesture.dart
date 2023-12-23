import 'package:flutter/material.dart';
import 'package:mir/core/constants/sizes.dart';
import '../../../core/constants/colors.dart';

class StatusCityGesture extends StatelessWidget {
  final void Function()? onTap;
  final String field;
  final TextStyle? style;
  final IconData? icon;
  const StatusCityGesture({Key? key, this.onTap, required this.field, this.style, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: Sizes.widthtwentyfive),
        padding: EdgeInsets.only(left: Sizes.widthtwenty,right: 8),
        height: Sizes.widthfifty,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.grey,width: 1)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: AppSize.width /1.45,
              child: Text(field,style: style)),
            Center(child: Icon(icon,color: AppColors.third,size: 30))
          ]
        )
      )
    );
  }
}