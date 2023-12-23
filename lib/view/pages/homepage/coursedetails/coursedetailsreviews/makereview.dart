import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/core/class/handlingdataview.dart';
import 'package:mir/core/constants/sizes.dart';
import '../../../../../controller/pages/homepagecontroller/coursedetailscontroller/coursedetailsreviewscontroller/makereview_controller.dart';
import '../../../../../core/components/longtextfield.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../widgets/pageswidget/homepagewidget/coursedetailswidget/starview.dart';

class MakeReview extends StatelessWidget {
  final String formationid;
  const MakeReview({Key? key, required this.formationid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MakereviewController());
    return Container(
      height: AppSize.height / 1.56,
        margin: EdgeInsets.all(Sizes.widthtwenty),
        child: GetBuilder<MakereviewController>(
          builder: (controller){
          return  ListView(
            children: [
              const Starsview(),
              const SizedBox(height: 30),
              LongTextField(data: '63'.tr,controller: controller.textEditingController,),
              Container(
                margin: const EdgeInsets.only(top: 50),
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: controller.isEmpty ? null : (){controller.submitreview(formationid);}  ,
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    width: AppSize.width / 3.3,
                    height: AppSize.height * 0.07,
                    decoration: BoxDecoration(
                      color: controller.isEmpty ? AppColors.grey : AppColors.secondary,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(child: Text('66'.tr,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: AppColors.textWhite,letterSpacing: 1))),
                  )
                )
              )
            ],
          );
        })
      );
  }
}

class EditReview extends StatelessWidget {
  final String formationid;
  const EditReview({Key? key, required this.formationid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EditreviewController(formationid: formationid));
    return Container(
      height: AppSize.height / 1.56,
        margin: EdgeInsets.all(Sizes.widthtwenty),
        child: GetBuilder<EditreviewController>(
          builder: (controller){
          return HandlingDataView(
            statusRequest: controller.statusRequest, 
            nodatawidget: Center(child: Image.asset('assets/nodata.png')), 
            loading: const Center(child: CircularProgressIndicator(color: AppColors.secondary,strokeWidth: 8)),
            widget: ListView(
            children: [
              const Starsviewtwo(),
              const SizedBox(height: 30),
              LongTextField(data: '63'.tr,controller: controller.textEditingController,),
              Container(
                margin: const EdgeInsets.only(top: 50),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: controller.isEmpty ? null : (){controller.editreview();}  ,
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        width: AppSize.width / 3.3,
                        height: AppSize.height * 0.07,
                        decoration: BoxDecoration(
                          color: controller.isEmpty ? AppColors.grey : AppColors.secondary,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(child: Text('64'.tr,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: AppColors.textWhite,letterSpacing: 1))),
                      )
                    ),
                    GestureDetector(
                      onTap: (){controller.deletereview();}  ,
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        width: AppSize.width / 3.3,
                        height: AppSize.height * 0.07,
                        decoration: BoxDecoration(
                          color:  const Color.fromARGB(255, 160, 39, 31),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(child: Text('65'.tr,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: AppColors.textWhite,letterSpacing: 1))),
                      )
                    )
                  ]
                )
              )
            ]
          ), 
          );
        })
      );
  }
}