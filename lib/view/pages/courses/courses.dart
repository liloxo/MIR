import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/controller/pages/coursescontroller/courses_controller.dart';
import 'package:mir/core/class/handlingdataview.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/sizes.dart';

class Courses extends StatelessWidget {
  const Courses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoursesController>(
      init: CoursesController(),
      builder: (controller){
      return Scaffold(
      appBar: controller.statusRequest != StatusRequest.success ? null :  AppBar(backgroundColor: AppColors.secondary,title: Text('32'.tr,style: const TextStyle(letterSpacing: 2,fontSize: 22),),centerTitle: true,elevation: 1,),
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.all(Sizes.widthtwenty),
        child: HandlingDataView(
          statusRequest: controller.statusRequest,
          loading: const Center(child: CircularProgressIndicator(strokeWidth: 7,color: AppColors.secondary)),
          nodatawidget: const Nocourses(), 
          widget: Container(
            margin: EdgeInsets.only(top: Sizes.widthtwentyfive),
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: Sizes.widthtwenty),
              padding: EdgeInsets.zero,
              itemCount: controller.formationmodel!.length,
              itemBuilder: (context,i){
              return InkWell(
                onTap: () {
                  Get.toNamed('coursedetails',arguments: {'formationmodel':controller.formationmodel![i],'formationid':controller.formationmodel![i].id});
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.third)
                  ),
                  child: Column(
                    children: [
                      Toprow(i),
                      const SizedBox(height: 10),
                      Bottomrow(i)
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

class Bottomrow extends GetView<CoursesController> {
  final int i;
  const Bottomrow(this.i, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 5),
          child: Text("${'60'.tr} ${controller.coursesmodel[i].groupe.toString()}", style: const TextStyle(fontSize: 17,fontWeight: FontWeight.w500))),
         Text(controller.coursesmodel[i].reserved == true ? '61'.tr : '62'.tr , style: const TextStyle(fontSize: 17,fontWeight: FontWeight.w500))
      ],
    );
  }
}

class Toprow extends GetView<CoursesController> {
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
              margin: const EdgeInsets.only(right: 5,left: 5,top: 15),
              width: Sizes.widthfifty,
              height: Sizes.widthfifty,
              child: Hero(
                tag: '${controller.formationmodel![i].image!}$i',
                child: ClipOval(
                  child: controller.formationmodel![i].image! == '' 
                  ? Image.asset('assets/nullpic.png')
                  : CachedNetworkImage(
                    imageUrl: controller.formationmodel![i].image!,
                    fit: BoxFit.cover,
                   )),
              )
            ),
            Container(
              padding: const EdgeInsets.only(top: 8),
              width: AppSize.width / 3.2,
              child:  Text(controller.formationmodel![i].teacher!,style: const TextStyle(color: AppColors.black,fontSize: 17,fontWeight: FontWeight.w700,letterSpacing: 1),maxLines: 1,overflow: TextOverflow.ellipsis)),
          ]
        ),
        SizedBox(
          width: AppSize.width / 3,
          child: Text(controller.formationmodel![i].title!,style: const TextStyle(color: AppColors.black,fontSize: 18,fontWeight: FontWeight.w600),maxLines: 1,overflow: TextOverflow.ellipsis)),
      ],
    );
  }
}

class Nocourses extends StatelessWidget {
  const Nocourses({
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
            Text('49'.tr,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w600,color: AppColors.secondary)),
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