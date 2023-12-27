import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/core/class/statusrequest.dart';
import 'package:mir/core/constants/colors.dart';
import 'package:mir/data/model/homepage/registermodel.dart';
import '../../../../controller/pages/homepagecontroller/coursedetailscontroller/coursedetailsregister_controller.dart';
import '../../../../core/constants/sizes.dart';
import '../../../widgets/pageswidget/homepagewidget/coursedetailswidget/custominkwell.dart';
import '../../../widgets/pageswidget/homepagewidget/coursedetailswidget/showapplysheet.dart';

class CourseDetailsRegister extends StatelessWidget {
  const CourseDetailsRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CoursedetailsRegisterController());
    return Container(
      margin: EdgeInsets.all(Sizes.widthtwenty),
      child: GetBuilder<CoursedetailsRegisterController>(
        builder: (controller){
        if(controller.statusRequest == StatusRequest.loading){
          return const Center(child: CircularProgressIndicator(color: AppColors.secondary,strokeWidth: 8));
        }if(controller.statusRequest == StatusRequest.success){
          return ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: controller.registermodel.length,
            separatorBuilder: (context,i)=> SizedBox(height: Sizes.widthtwentyfive), 
            itemBuilder: (context ,i){
              return Groupecontainer(
                i,controller.registermodel[i]
              );
            }
          );
        }else{
          return Center(child: Image.asset('assets/nodata.png'));
        }
      })
    );
  }
}

class Groupecontainer extends GetView<CoursedetailsRegisterController> {
  final int i;
  final RegisterModel registerModel;
  const Groupecontainer(this.i, this.registerModel, {super.key, });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: controller.whentap[i] ? AppColors.third :AppColors.grey),
        borderRadius: BorderRadius.circular(13)
      ),
      padding: EdgeInsets.symmetric(horizontal: Sizes.widthfifteen),
      height: controller.whentap[i] ? null : Sizes.widthsixty ,
      width: double.infinity,
      child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("${'60'.tr} ${i+1}",style: Theme.of(context).textTheme.bodyLarge),
            IconButton(
              onPressed : (){
                controller.opengroupe(i);
                controller.whentap[i] ? controller.checkregistration( i) : null;
                },
              icon : Icon(controller.whentap[i] ? Icons.arrow_drop_up : Icons.arrow_drop_down)
            )
          ]
        ),
        !controller.whentap[i] ? const SizedBox()
        : Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: Sizes.widthfifteen),
            Groupeinfo(property: '15'.tr,condition: registerModel.status! == 'Available' ? '46'.tr : '47'.tr),
            Groupeinfo(property: '75'.tr,condition: registerModel.duration! == '' ? '91'.tr : registerModel.duration!),
            Groupeinfo(property: '76'.tr,condition: registerModel.price! == '' ? '91'.tr : registerModel.price!),
            Groupeinfo(property: '61'.tr,condition: registerModel.seats == null ? "${registerModel.reserved}" : "${registerModel.reserved}/${registerModel.seats}"),
            controller.checkreg[i] == true 
            ? Container(
              margin: EdgeInsets.symmetric(vertical: Sizes.widthtwenty),
              child: const Center(child: CircularProgressIndicator(color: AppColors.secondary,strokeWidth: 5)))
            : Container(
              margin: EdgeInsets.only(top: Sizes.widthfifty,bottom: Sizes.widthtwenty),
              alignment: Alignment.bottomCenter,
              child: controller.isapplied[i] == null
              ? CustomInkWell(
                data: registerModel.status! == 'Available'  ? '71'.tr : '47'.tr, 
                selected: registerModel.status! == 'Available'  ? true : false,
                onTap:  registerModel.status! == 'Available' 
                ? (){showapplysheet((){controller.apply(i);});} 
                : null,
                )
              : Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomInkWell(
                   selected: false ,
                   data: controller.isapplied[i] == 'pending' ? '62'.tr: '61'.tr,
                   ),
                  CustomInkWellCancel(selected: true,data: '70'.tr,onTap: () {controller.showdi(i);})
                ])
            )
          ]
        )
      ]
    )
    );
  }
}

class Groupeinfo extends StatelessWidget {
  final String property;
  final String condition;
  const Groupeinfo({super.key, required this.property, required this.condition, });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Sizes.widthfifteen,top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(property,style: Theme.of(context).textTheme.displayMedium),
          Text(condition,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 17,letterSpacing: 1)),
        ]
      ),
    );
  }
}