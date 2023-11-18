import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/core/constants/colors.dart';
import 'package:mir/core/constants/sizes.dart';
import 'package:mir/core/functions/validinput.dart';
import 'package:mir/view/widgets/userdetailswidget/statuscitygesture.dart';
import '../../controller/userdetails/userdetails_controller.dart';
import '../../core/components/customtextformfield.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserdetailsController controller = Get.put(UserdetailsController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Form(
            key: controller.globalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppSize.height * 0.08),
                Text('1'.tr,style: Theme.of(context).textTheme.displayLarge),
                Container(
                  margin: const EdgeInsets.only(top: 20,bottom: 35),
                  child: Text('12'.tr,style: Theme.of(context).textTheme.bodyLarge)
                ),
                SizedBox(
                  height: AppSize.height / 10,
                  child: CustomTextFormField(
                    valid: (val) {
                      return validInput(val!, 3, 50,null);
                    },
                    mycontroller: controller.fullnamecontroller,
                    labeltext: '13'.tr,suffixIcon: const Icon(Icons.person,color: AppColors.secondary), enabled: true),
                ),
                Obx(() => 
                StatusCityGesture(
                  field: controller.status.value,
                  icon: Icons.arrow_drop_down,
                  style: controller.statusstyle('15'.tr.obs,controller.status),
                  onTap: () {
                   controller.statustap();
                  })
                ),
                Obx(() => 
                StatusCityGesture(
                  field: controller.selectedCity!.value,
                  icon: Icons.location_city,
                  style: controller.statusstyle('16'.tr.obs,controller.selectedCity!),
                  onTap: () {
                   controller.citytap(context);
                  })
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 30),
                  child: 
                    GestureDetector(
                      onTap: () {
                        controller.saveinfo();
                      },
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        width: 150,
                        height: 60,
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child:  Center(child: Text('22'.tr,style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w500,color: AppColors.textWhite,letterSpacing: 1))),
                      ),
                    )
                )
              ]
            ),
          )
        )
      )
    );
  }
}