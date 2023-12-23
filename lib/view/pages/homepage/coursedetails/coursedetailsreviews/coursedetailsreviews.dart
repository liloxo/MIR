import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/core/class/handlingdataview.dart';
import 'package:mir/core/constants/colors.dart';
import 'package:mir/core/constants/sizes.dart';
import '../../../../../controller/pages/homepagecontroller/coursedetailscontroller/coursedetailsreviewscontroller/coursedetailsreviews_controller.dart';

class CourseDetailsReviews extends StatelessWidget {
  const CourseDetailsReviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoursedetailsReviewsController>(
      init: CoursedetailsReviewsController(),
      builder: (controller){
      return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: controller.ischeck ? Reviewbutton(formationid: controller.formationid) : null,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: Sizes.widthtwenty),
        child: HandlingDataView(
          loading: const Center(child: CircularProgressIndicator(color: AppColors.secondary,strokeWidth: 8)),
          statusRequest: controller.statusRequest, 
          nodatawidget: Center(child: Image.asset('assets/nodata.png')),
          widget: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Text('45'.tr,style: const TextStyle(color: AppColors.black,fontSize: 25,fontWeight: FontWeight.w600,letterSpacing: 1)),
           Container(
            margin: const EdgeInsets.only(top: 10,bottom: 20),
             child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Icon(Icons.star,color: Colors.yellow,size: 27,),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(controller.averageStars.toString(),style:  TextStyle(color: AppColors.black,fontSize: 20,fontWeight: FontWeight.values[5],letterSpacing: 1),)),
                Text("(${controller.length} ${'45'.tr})",style:  TextStyle(color: AppColors.black,fontSize: 20,fontWeight: FontWeight.values[4],letterSpacing: 1),),
              ]
             )
           ),]
        ),
              Expanded(
                child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: controller.reviewsmodel.length,
                itemBuilder: (context,i){
                return Studentreview(i);
                }
              ),)
            ],
          ),
          )
      ),
    );
    });
  }
}
class Studentreview extends GetView<CoursedetailsReviewsController> {
  final int i;
  const Studentreview(this.i, {super.key, });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Sizes.widthfifteen),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
       children: [
        const Divider(thickness: 2),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
           Text(controller.reviewsmodel[i].name!,style: const TextStyle(fontSize: 18,color: AppColors.black,fontWeight: FontWeight.w500,letterSpacing: 1)),
           SizedBox(
            height: Sizes.widthfifty,
            width: AppSize.width / 3,
             child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.reviewsmodel[i].stars,
              itemBuilder: (context, index) => const Icon(Icons.star,color: Colors.yellow,size: 22))
           )
         ]),
         Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Text(controller.reviewsmodel[i].date!,style: const TextStyle(fontSize: 16,color: AppColors.grey,fontWeight: FontWeight.w600))),
         controller.reviewsmodel[i].review == null 
         ? const SizedBox()
         : Text(controller.reviewsmodel[i].review!,style: const TextStyle(fontSize: 14,color: AppColors.grey,fontWeight: FontWeight.w500)),
       ],
      ),
    );
  }
}

class Reviewbutton extends GetView<CoursedetailsReviewsController> {
  final String formationid;
  const Reviewbutton({
    super.key, required this.formationid,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        controller.text! == '67'.tr ?
        controller.makereview(): controller.editreview();
      },
      child: Container(
        margin: const EdgeInsets.only(right: 5),
        height: Sizes.widthsixty,
        width: AppSize.width / 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color:AppColors.secondary
        ),
        child:  Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(controller.text!,style: const TextStyle(color: AppColors.textWhite ,fontSize: 15,fontWeight: FontWeight.w500,letterSpacing: 1))
          )
        )
      )
    );
  }
}

