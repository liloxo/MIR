import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/core/constants/colors.dart';
import '../../../../controller/pages/homepagecontroller/coursedetailscontroller/coursedetailsregister_controller.dart';
import '../../../../core/constants/sizes.dart';
import '../../../widgets/pageswidget/homepagewidget/coursedetailswidget/custominkwell.dart';

class CourseDetailsRegister extends StatelessWidget {
  const CourseDetailsRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CoursedetailsRegisterController());
    return Container(
      margin: EdgeInsets.all(Sizes.widthtwenty),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: 5,
        separatorBuilder: (context,i)=> SizedBox(height: Sizes.widthtwentyfive), 
        itemBuilder: (context ,i){
        return GetBuilder<CoursedetailsRegisterController>(
          builder: (controller){
          return Groupecontainer(i);
        });
        }
        )
    );
  }
}

class Groupecontainer extends GetView<CoursedetailsRegisterController> {
  final int i;
  const Groupecontainer(this.i, {super.key, });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: controller.whentap[i] ? AppColors.third :AppColors.grey),
        borderRadius: BorderRadius.circular(13)
      ),
      padding: EdgeInsets.symmetric(horizontal: Sizes.widthfifteen),
      height: controller.whentap[i] ? null : 60 ,
      width: double.infinity,
      child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Groupe ${i+1}',style: Theme.of(context).textTheme.bodyLarge),
            IconButton(
              onPressed : (){controller.opengroupe(i);},
              icon : Icon(controller.whentap[i] ? Icons.arrow_drop_up : Icons.arrow_drop_down)
            )
          ]
        ),
        !controller.whentap[i] ? const SizedBox()
        : Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 15),
            const Groupeinfo(property: 'Status',condition: 'Available'),
            const Groupeinfo(property: 'Duration',condition: '3 hours a week'),
            const Groupeinfo(property: 'Price',condition: '3000da'),
            const Groupeinfo(property: 'City',condition: 'Biskra'),
            const Groupeinfo(property: 'Location',condition: 'Check'),
            const Groupeinfo(property: 'Seats',condition: '30/40'),
            Container(
              margin: const EdgeInsets.only(top: 50,bottom: 20),
              alignment: Alignment.bottomCenter,
              child: CustomInkWell(selected: true,data: 'Apply',onTap: (){},))
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