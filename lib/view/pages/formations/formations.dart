import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/controller/pages/formationscontroller/formations_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/sizes.dart';

class Formations extends StatelessWidget {
  const Formations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormationsController>(
      init: FormationsController(),
      builder: (controller){
      return Scaffold(
        backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.all(Sizes.widthtwenty),
        child: HandlingDataView(
          statusRequest: controller.statusRequest,
          loading: const Center(child: CircularProgressIndicator(strokeWidth: 7,color: AppColors.secondary)),
          nodatawidget: const Noformations(), 
          widget: Container(
            margin: EdgeInsets.only(top: Sizes.widthtwentyfive),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: controller.formationmodel.length,
              itemBuilder: (context,i){
              return InkWell(
                onTap: () {
                  Get.toNamed('formationdetails',arguments: {'formationmodel':controller.formationmodel[i],'formationid':controller.formationmodel[i].id});
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: Sizes.widthtwenty),
                  padding: EdgeInsets.all(Sizes.widthfifteen),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.third)
                  ),
                  child: Column(
                    children: [
                      Toprow(i),
                      const SizedBox(height: 10),
                    ]
                  )
                ),
              );
            })
          )
        )
      )
    );
    });
  }
}

class Toprow extends GetView<FormationsController> {
  final int i;
  const Toprow( this.i, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 5,left: 5,top: Sizes.widthfifteen),
              width: Sizes.widthfifty,
              height: Sizes.widthfifty,
              child: Hero(
                tag: '${controller.formationmodel[i].image!}$i',
                child: ClipOval(
                  child: controller.formationmodel[i].image! == '' 
                  ? Image.asset('assets/nullpic.png')
                  : CachedNetworkImage(
                    imageUrl: controller.formationmodel[i].image!,
                    fit: BoxFit.cover,
                   )),
              )
            ),
            Container(
              padding: const EdgeInsets.only(top: 8),
              width: AppSize.width / 3.2,
              child:  Text(controller.formationmodel[i].title!,style: const TextStyle(color: AppColors.black,fontSize: 17,fontWeight: FontWeight.w700,letterSpacing: 1),maxLines: 1)),
          ]
        ),
        SizedBox(
          width: AppSize.width / 3.8,
          child: Text(controller.formationmodel[i].description!,style: const TextStyle(color: AppColors.black,fontSize: 18,fontWeight: FontWeight.w600),maxLines: 1,overflow: TextOverflow.ellipsis)),
      ],
    );
  }
}
class Noformations extends StatelessWidget {
  const Noformations({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(Sizes.widthtwenty),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('100'.tr,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w600,color: AppColors.secondary)),
            SizedBox(
              height: AppSize.height / 2,
              width: double.infinity,
              child: Image.asset('assets/nocourses.png'))
          ]
        )
      )
    );
  }
}