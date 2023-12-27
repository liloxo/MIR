import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/view/widgets/pageswidget/homepagewidget/coursedetailswidget/custominkwell.dart';
import '../../../../../controller/pages/formationscontroller/formationpages/formationreserved_controller.dart';
import '../../../../../core/class/handlingdataview.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/functions/printing.dart';

class FormationReserved extends StatelessWidget {
  const FormationReserved({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FormationreservedController());
    return GetBuilder<FormationreservedController>(
      builder: (controller){
      return Container(
      margin: EdgeInsets.all(Sizes.widthtwenty),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: controller.formationmodel.groupes,
        itemBuilder: (context,i){
         return Groupecontainer(i);
      }),
    );
    }); 
  }
}

class Groupecontainer extends GetView<FormationreservedController> {
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
      margin: EdgeInsets.only(bottom: Sizes.widthtwentyfive),
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
                },
              icon : Icon(controller.whentap[i] ? Icons.arrow_drop_up : Icons.arrow_drop_down)
            )
          ]
        ),
        if (!controller.whentap[i]) const SizedBox() else HandlingDataView(
            statusRequest: controller.statusRequest[i], 
            widget: Column(
              children: [
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: controller.groupestudents.length,
                  itemBuilder: (context,index){
                  return InkWell(
                    onLongPress: () {
                      controller.showdia(index, controller.groupestudents[index].id);
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: Sizes.widthfifteen),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.third ),
                        borderRadius: BorderRadius.circular(13)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: AppSize.width /1.3,
                            child: Text(controller.groupestudents[index].name!,style: const TextStyle(fontSize: 17,color: AppColors.black,fontWeight: FontWeight.w500,letterSpacing: 1,overflow: TextOverflow.ellipsis))),
                          SizedBox(
                            width: AppSize.width /1.3,
                            child: Text(controller.groupestudents[index].email!,style: const TextStyle(fontSize: 17,letterSpacing: 1,color: AppColors.black,fontWeight: FontWeight.w500,overflow: TextOverflow.ellipsis))),
                        ],
                      ),
                    ),
                  );
                }),
                Container(
                  margin: EdgeInsets.symmetric(vertical: Sizes.widthfifteen),
                  width: AppSize.width /4.2,
                  height: AppSize.width/ 7.6,
                  child: CustomInkWell(data: '98'.tr, selected: true,onTap: () => printDoc(controller.groupestudents,"${'60'.tr} ${i+1}"),))
              ],
            ),
            nodatawidget: Center(child: Image.asset('assets/nodata.png')), 
            loading: const Center(child: CircularProgressIndicator(color: AppColors.secondary,strokeWidth: 5))
         ),
      ]
    )
    );
  }
}