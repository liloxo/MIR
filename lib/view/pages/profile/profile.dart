import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/controller/pages/profilecontroller/profile_controller.dart';
import 'package:mir/core/constants/colors.dart';
import 'package:mir/view/pages/profile/chooselang.dart';
import '../../widgets/pageswidget/profilewidget/profilelisttile.dart';
import '../../widgets/pageswidget/profilewidget/profiletoprow.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: AppColors.textWhite,
      body: Container(
      margin: const EdgeInsets.all(10),
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30),
            alignment: Alignment.center,
            child: Text('35'.tr,style: Theme.of(context).textTheme.displayLarge) 
          ),
          GetBuilder<ProfileController>(builder: (con){
            return ProfileTopRow(name: controller.fullname, email: controller.email!,image: con.image,);
          }),
          Column(
            children: [
              const SizedBox(height: 50),
              ProfileListTile(leading: const Icon(Icons.person_3_outlined),title: '36'.tr,onTap: (){Get.toNamed('personalinfo',arguments: {'image':controller.image});}),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 25),
                child: ProfileListTile(leading: const Icon(Icons.language_outlined),title: '37'.tr,onTap: (){chooselang(context);})),
             // ProfileListTile(leading: const Icon(Icons.event_note_outlined),title: '38'.tr,onTap: (){Get.toNamed('contactus');}),
              //ProfileListTile(leading: const Icon(Icons.share_outlined),title: '39'.tr,onTap: (){controller.shareapp();}),
              LogoutListTile(onTap: () => controller.signout())
            ]
          )
        ]
      )
    )
    );
  }
}