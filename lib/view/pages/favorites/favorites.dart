import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/controller/pages/favoritecontroller/favorite_controller.dart';
import 'package:mir/core/class/handlingdataview.dart';
import 'package:mir/core/class/statusrequest.dart';
import 'package:mir/core/constants/colors.dart';
import 'package:mir/core/constants/sizes.dart';
import '../../widgets/pageswidget/homepagewidget/coursecard.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteController>(
      init: FavoriteController(),
      builder: (controller){
      return Scaffold(
      appBar: controller.statusRequest != StatusRequest.success ? null :  AppBar(backgroundColor: AppColors.secondary,title: Text('31'.tr,style: const TextStyle(letterSpacing: 2,fontSize: 22),),centerTitle: true,elevation: 1,),
      body: Container(
        margin: EdgeInsets.all(Sizes.widthtwenty),
        child: HandlingDataView(
          statusRequest: controller.statusRequest,
          loading: const Center(child: CircularProgressIndicator(strokeWidth: 7,color: AppColors.secondary,)),
          nodatawidget: const Nofavorites(),
          widget: Container(
            margin: EdgeInsets.only(top: Sizes.widthtwentyfive),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: controller.formationmodel!.length,
              itemBuilder: (context,i){
              return CourseCard(
                i: i,
                formationmodel: controller.formationmodel![i], 
                child: InkWell(
                  onTap: () {
                    controller.favoritetap(i);
                  },
                  child: const Icon(Icons.favorite ,color: AppColors.secondary)
                )
              );
            }),
          )
        )
      )
    );
    });
  }
}

class Nofavorites extends StatelessWidget {
  const Nofavorites({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('48'.tr,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w600,color: AppColors.secondary)),
              SizedBox(
    height: AppSize.height / 2,
    width: double.infinity,
    child: Image.asset('assets/nofavorites.png')),
            ],
          );
  }
}