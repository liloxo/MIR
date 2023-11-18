import 'package:flutter/material.dart';
import '../constants/sizes.dart';

class ImageDecoration extends StatelessWidget {
  final String? image;
  const ImageDecoration({Key? key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.height * 0.16,
      child: image == null
        ? Image.asset('assets/nullpic.png')
        : Container(
            width: AppSize.height * 0.19,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(image!)
              )
            )
          )
    );
  }
}