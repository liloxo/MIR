import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/core/constants/sizes.dart';
import 'package:mir/view/widgets/pageswidget/homepagewidget/topcolumnhome.dart';
import '../../../controller/pages/homepagecontroller/homepage_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/components/loadingshimmer.dart';
import '../../../core/constants/colors.dart';
import '../../widgets/pageswidget/homepagewidget/categoriesview.dart';
import '../../widgets/pageswidget/homepagewidget/coursecard.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomepageController>(
      init: HomepageController(),
      builder: (controller){
      return Scaffold(
      body: Container( 
        margin: EdgeInsets.all(Sizes.widthtwenty),
        child: Column(
          children: [
            TopColumnHome(
              onChanged: (value) {controller.searchchange(value);} 
            ),
            controller.forcategory ? const SizedBox(): const CategoriesView(),
            Expanded(
              child: HandlingDataView(
                loading: const LoadingShimmer(),
                nodatawidget: const ImageStatus(image: 'assets/nodata.png'),
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: controller.formationmodel.length,
                  itemBuilder: (context,i){
                  return CourseCard(
                    i: i,
                    formationmodel: controller.formationmodel[i], 
                    child:InkWell(
                      onTap: () {
                        controller.favoritetap(controller.formationmodel[i].isfav!,i);
                      },
                      child: Icon(controller.formationmodel[i].isfav! ? Icons.favorite : Icons.favorite_border_outlined ,color: AppColors.secondary)
                    )
                  );
                })
              )
            )
          ]
        )
      )
    );
    });
  }
}