import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/colors.dart';

class ProfileListTile extends StatelessWidget {
  final Widget leading;
  final String title;
  final void Function()? onTap;
  const ProfileListTile({Key? key, required this.leading, required this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        onTap: onTap,
        leading: leading,
        title: Text(title,style: Theme.of(context).textTheme.bodyLarge),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}

class LogoutListTile extends StatelessWidget {
  final void Function()? onTap;
  const LogoutListTile({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        onTap: onTap,
        leading: const Icon(Icons.logout_outlined,color: AppColors.secondary),
        title: Text('40'.tr,style: const TextStyle(color: AppColors.secondary,fontSize: 18,fontWeight: FontWeight.w600)),
        trailing: const Icon(Icons.arrow_forward_ios,color: AppColors.secondary)
      )
    );
  }
}