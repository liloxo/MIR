import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/core/class/handlingdataview.dart';
import 'package:mir/core/constants/sizes.dart';

import '../../../../../controller/pages/formationscontroller/formationpages/formationrequests_controller.dart';
import '../../../../../core/constants/colors.dart';

class FormationRequests extends StatelessWidget {
  const FormationRequests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormationrequestsController>(
      init: FormationrequestsController(),
      builder: (controller){
      return HandlingDataView(
        statusRequest: controller.statusRequest, 
        loading: const Center(child: CircularProgressIndicator(strokeWidth: 7,color: AppColors.secondary)),
        nodatawidget: Center(child: Image.asset('assets/nodata.png')),
        widget: ListView.separated(
        padding: EdgeInsets.zero,
        separatorBuilder: (context,i)=> SizedBox(height: Sizes.widthfifteen),
        itemCount: controller.groupestudents.length,
        itemBuilder: ((context, i) {
        return Container(
        margin: EdgeInsets.all(Sizes.widthtwenty),
        padding: EdgeInsets.all(Sizes.widthfifteen),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.third)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(controller.groupestudents[i].name!,style: const TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: AppColors.black,letterSpacing: 1)),
                SizedBox(
                  width: AppSize.width / 1.8,
                  child: Text(controller.groupestudents[i].email!,maxLines: 2,
                  style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.black,letterSpacing: 1,overflow: TextOverflow.ellipsis)),
                ),
                Text(controller.groupestudents[i].groupeid!,style: const TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: AppColors.black,letterSpacing: 1)),
              ],
            ),
            Column(
            children: [
              TextButton(
                onPressed: (){controller.acceptstudent(i);}, 
                child: Text('96'.tr,style: const TextStyle(color: AppColors.secondary,fontSize: 17))),
              TextButton(onPressed: (){controller.declinestudent(i);}, child: Text('97'.tr,style: const TextStyle(color: Colors.red,fontSize: 17)))
            ]
           ), 
          ],
        )
      ); 
      })), 
        );
    });
  }
}