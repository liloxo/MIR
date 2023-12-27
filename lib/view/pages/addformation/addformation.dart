import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/controller/pages/addformationcontroller/addformation_controller.dart';
import 'package:mir/core/constants/colors.dart';
import 'package:mir/core/constants/sizes.dart';
import 'package:mir/view/widgets/pageswidget/homepagewidget/coursedetailswidget/custominkwell.dart';
import '../../../core/components/longtextfield.dart';
import '../../widgets/userdetailswidget/statuscitygesture.dart';

class AddFormation extends StatelessWidget {
  const AddFormation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddformationController());
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(Sizes.widthtwenty),
        child: GetBuilder<AddformationController>(
          builder: (controller){
          return !controller.iscreate ? const Addcourse(): const Fillgroupes();
          
        })
      ) 
    );
  }
}

class Fillgroupes extends GetView<AddformationController> {
  const Fillgroupes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Row(
        crossAxisAlignment: CrossAxisAlignment.start,
         children: [
          IconButton(onPressed: (){controller.getback();}, icon: const Icon(Icons.arrow_back)),
          Text('85'.tr,style: const TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600,letterSpacing: 1)),
         ],
       ),
       Expanded(
         child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: controller.nums.length,
          itemBuilder: (context,i){
            GroupController groupController = controller.groupControllers[i];
          return Container(
          margin: EdgeInsets.only(top: Sizes.widthfifteen),
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
            ],
          ),
         );
         }),
       ),
       CustomInkWell(data: '87'.tr, selected: true,onTap: () {
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
          controller.storeformation();
          for (int i = 0; i < controller.groupControllers.length; i++) {
           GroupController groupController = controller.groupControllers[i];
           controller.storegroupes("groupe${i+1}",groupController.priceController.text,groupController.timeController.text,int.tryParse(groupController.seatsController.text));
           }
           Get.back();
         }
       })
      ],
    );
  }
}

class Addcourse extends StatelessWidget {
  const Addcourse({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddformationController>(
      builder: (controller){
      return ListView(
        padding: EdgeInsets.zero,
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: IconButton(onPressed: (){Get.back();}, icon: const Icon(Icons.arrow_back,size: 25,))),
        StatusCityGesture(
          field: controller.cat,
          icon: Icons.arrow_drop_down,
          style: controller.statusstyle(controller.cat,'79'.tr),
          onTap: () {controller.selecttap(context);}
        ),
        StatusCityGesture(
          field: controller.city,
          icon: Icons.arrow_drop_down,
          style: controller.statusstyle(controller.city,'80'.tr),
          onTap: () {controller.selectcity(context);}
        ),
        LongTextField(data: '81'.tr,controller: controller.title,maxLines: 1,maxLength: 20),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: LongTextField(data: '82'.tr,controller: controller.description,maxLines: 5,maxLength: 150)),
        LongTextField(data: '83'.tr,controller: controller.groupes,maxLines: 1),
        SizedBox(height: Sizes.widthtwenty),
        StatusCityGesture(
          field: '84'.tr,
          icon: Icons.location_on,
          style: controller.statusstyle('Select Location','Select Location'),
          onTap: () {}
        ),
        CustomInkWell(data: '11'.tr, selected: true,onTap: () {controller.create();})
      ]
    );
    });
  }
}