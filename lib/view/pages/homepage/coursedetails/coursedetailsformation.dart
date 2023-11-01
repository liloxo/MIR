import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/core/constants/colors.dart';
import '../../../../controller/pages/homepagecontroller/coursedetailscontroller/coursedetailsformation_controller.dart';
import '../../../../core/constants/sizes.dart';

class CourseDetailsFormation extends StatelessWidget {
  const CourseDetailsFormation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CoursedetailsFormationController controller = Get.put(CoursedetailsFormationController());
    return Container(
      margin: EdgeInsets.all(Sizes.widthfifteen),
      child: ListView(
        padding: EdgeInsets.zero,
        children:  [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
            IconButton(onPressed: (){Get.back();}, icon: const Icon(Icons.arrow_back,size: 28)),
            Container(
              margin: EdgeInsets.only(left: Sizes.widthfifteen),
              child: Text(controller.title!,style: Theme.of(context).textTheme.displayMedium)),
          ]),
          SizedBox(height: Sizes.widthtwenty),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(right: Sizes.widthfifteen,left: Sizes.widthfifteen),
                width: Sizes.widthfifty,
                height: Sizes.widthfifty,
                child: Hero(
                  tag: '${controller.image}1',
                  child: ClipOval(
                    child: CachedNetworkImage( imageUrl: controller.image!,fit: BoxFit.cover),
                  ),
                ),
              ),
              Text(controller.teacher!,style: const TextStyle(fontSize: 22,color: AppColors.secondary,fontWeight: FontWeight.w600),)
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(controller.description!,style: const TextStyle(fontSize: 18,color: AppColors.grey,fontWeight: FontWeight.w600)),
          ),
          const Formationitem(itemtitle: 'Status',itemstatus: 'Available'),
          const Formationitem(itemtitle: 'Groupes',itemstatus: '5'),
        ],
      ),
    );
  }
}

class Formationitem extends StatelessWidget {
  final String itemtitle;
  final String itemstatus;
  const Formationitem({super.key, required this.itemtitle, required this.itemstatus,});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children:  [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(itemtitle,style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w600, color: AppColors.black),),
        ),
        Container(
          height: 50,
          padding: const EdgeInsets.only(right: 10,left: 10,top: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            border: Border.all(color: AppColors.secondary)
          ),
          child: Text(itemstatus,style: const TextStyle(fontSize: 17,fontWeight: FontWeight.w600,letterSpacing: 1)), 
        )
      ],
    );
  }
}