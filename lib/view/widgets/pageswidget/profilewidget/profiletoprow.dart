import 'package:flutter/material.dart';
import '../../../../core/constants/sizes.dart';

class ProfileTopRow extends StatelessWidget {
  final String name;
  final String email;
  const ProfileTopRow({Key? key, required this.name, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
       Container(
        margin: EdgeInsets.only(right: AppSize.width * 0.06),
        height: AppSize.width * 0.28,
        width: AppSize.width * 0.28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
        ),
        child: Image.asset('assets/onboardingone.png',fit: BoxFit.fill)
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