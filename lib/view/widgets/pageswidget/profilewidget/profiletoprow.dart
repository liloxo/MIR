import 'package:flutter/material.dart';
import 'package:mir/core/components/imagedecoration.dart';
import '../../../../core/constants/sizes.dart';

class ProfileTopRow extends StatelessWidget {
  final String name;
  final String email;
  final String? image;
  const ProfileTopRow({Key? key, required this.name, required this.email, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
       Container(
        margin: EdgeInsets.only(right: AppSize.width * 0.06),
        padding:  EdgeInsets.all(Sizes.widthfifteen),
        height: AppSize.width * 0.28,
        width: AppSize.width * 0.28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
        ),
        child: ImageDecoration(image: image)
       ),
       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: AppSize.width * 0.6,
            child: Text(name,style: Theme.of(context).textTheme.displayMedium,maxLines: 1,overflow: TextOverflow.ellipsis)),
          SizedBox(
            width: AppSize.width * 0.6,
            child: Text(email,style: Theme.of(context).textTheme.bodyLarge,maxLines: 1,overflow: TextOverflow.ellipsis))
        ]
       )
    ]);
  }
}