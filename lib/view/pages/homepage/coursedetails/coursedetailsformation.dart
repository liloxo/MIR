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
              margin: EdgeInsets.only(left: Sizes.widthfifteen,right: Sizes.widthsixty),
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
        ],
      ),
    );
  }
}