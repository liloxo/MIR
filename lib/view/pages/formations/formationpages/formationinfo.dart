import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/pages/formationscontroller/formationpages/formationinfo_controller.dart';
import '../../../../core/components/longtextfield.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/sizes.dart';
import '../../../widgets/pageswidget/homepagewidget/coursedetailswidget/custominkwell.dart';
import '../../../widgets/userdetailswidget/statuscitygesture.dart';

class Formationinfo extends StatelessWidget {
  const Formationinfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(Sizes.widthtwenty),
      child: GetBuilder<FormationinfoController>(
        init: FormationinfoController(),
        builder: (controller){
        return Column(
          children: [
            Container(
            alignment: Alignment.topLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){Get.back();}, icon: const Icon(Icons.arrow_back,size: 28,)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${'15'.tr} (${controller.formationmodel.status})",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                    Switch(value: controller.isstatus!, onChanged: (val){controller.changeswitch(val);},activeColor: AppColors.secondary,),
                  ],
                )
              ],
            )),
            Expanded(
              child: ListView(
              padding: EdgeInsets.zero,
              children: [
                StatusCityGesture(
                  field: controller.formationmodel.category!,
                  icon: Icons.arrow_drop_down,
                  style: const TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600,letterSpacing: 1),
                  onTap: () {controller.selecttap(context);}
                ),
                StatusCityGesture(
                  field: controller.formationmodel.city!,
                  icon: Icons.arrow_drop_down,
                  style: const TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600,letterSpacing: 1),
                  onTap: () {controller.selectcity(context);}
                ),
                LongTextField(data: '81'.tr,controller: controller.texttitle,maxLines: 1,maxLength: 20),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: LongTextField(data: '82'.tr,controller: controller.textdesc,maxLines: 5,maxLength: 150)),
                SizedBox(height: Sizes.widthtwenty),
                StatusCityGesture(
                  field: '84'.tr,
                  icon: Icons.location_on,
                  style: const TextStyle(color: Colors.grey,fontSize: 18,fontWeight: FontWeight.w600,letterSpacing: 1),
                  onTap: () {}
                ),
                CustomInkWell(data: '94'.tr, selected: true,onTap: () {controller.updateformation();})
              ]
            ),
            ),
          ],
        );
      })
    );
  }
}