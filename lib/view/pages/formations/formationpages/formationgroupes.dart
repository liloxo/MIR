import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/core/class/handlingdataview.dart';
import '../../../../controller/pages/addformationcontroller/addformation_controller.dart';
import '../../../../controller/pages/formationscontroller/formationpages/formationgroupes_controller.dart';
import '../../../../core/components/longtextfield.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/sizes.dart';
import '../../../widgets/pageswidget/homepagewidget/coursedetailswidget/custominkwell.dart';

class FormationGroupes extends StatelessWidget {
  const FormationGroupes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormationgroupesController>(
      init: FormationgroupesController(),
      builder: (controller){
      return Container(
        margin: EdgeInsets.all(Sizes.widthtwenty),
        child: Column(
        children: [
         Expanded(
           child: HandlingDataView(
            statusRequest: controller.statusRequest,
            loading: const Center(child: CircularProgressIndicator(strokeWidth: 7,color: AppColors.secondary)),
            nodatawidget: Center(child: Image.asset('assets/nodata.png')),
            widget: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: controller.formationmodel.groupes,
            itemBuilder: (context,i){
              GroupController groupController = controller.groupControllers[i];
            return Container(
            margin: EdgeInsets.only(bottom: Sizes.widthtwenty),
            padding: EdgeInsets.all(Sizes.widthfifteen),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.third ),
              borderRadius: BorderRadius.circular(13)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(" ${'60'.tr} ${i+1}",style: const TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500,letterSpacing: 1)),
                SizedBox(height: Sizes.widthfifteen),
                LongTextField(data: '86'.tr,maxLines: 1,controller: groupController.timeController ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: Sizes.widthtwenty),
                  child: LongTextField(data: '76'.tr,maxLines: 1,controller: groupController.priceController,)),
                LongTextField(data: '77'.tr,maxLines: 1,controller: groupController.seatsController,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${'15'.tr} (${controller.groupControllers[i].status})"),
                    Switch(value: controller.groupControllers[i].isstatus, onChanged: (val){controller.changeswitch(i,val);},activeColor: AppColors.secondary,),
                  ],
                )
              ]
            )
           );
           })
            )
         ),
         CustomInkWell(data: '94'.tr, selected: true,onTap: () {
          bool? isnum ;
          for (int i = 0; i < controller.groupControllers.length; i++) {
            GroupController groupController = controller.groupControllers[i];
            if(groupController.seatsController.text.isNotEmpty){
              if(!groupController.seatsController.text.isNum){
                isnum = false;
                break;
              }
            }
          } if(isnum == false){
            Get.defaultDialog(content: Text('90'.tr));
          } else{
             for (int i = 0; i < controller.groupControllers.length; i++) {
              GroupController groupController = controller.groupControllers[i];
              controller.updategroupes("groupe${i+1}",groupController.priceController.text,groupController.timeController.text,int.tryParse(groupController.seatsController.text),groupController.status);
              }
             Get.back();
           }
         })
        ],
          ),
      );
    });
  }
}