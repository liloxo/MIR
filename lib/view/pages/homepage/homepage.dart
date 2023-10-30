import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/core/components/loadingshimmer.dart';
import 'package:mir/core/constants/sizes.dart';
import 'package:mir/view/widgets/pageswidget/homepagewidget/topcolumnhome.dart';
import '../../../controller/pages/homepagecontroller/homepage_controller.dart';
import '../../widgets/pageswidget/homepagewidget/categoriesview.dart';
import '../../widgets/pageswidget/homepagewidget/coursecard.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomepageController());
    return GetBuilder<HomepageController>(
      builder: (controller){
      return Scaffold(
      body: Container(
        margin: EdgeInsets.all(Sizes.widthtwenty),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            TopColumnHome(
              firstname: controller.fullname,
              onChanged: (value) {
                controller.searchchange(value);
                
              } 
            ),
            SizedBox(
              child: controller.isloading 
            ? const LoadingShimmer()
              : controller.issearch 
              ? Image.asset('assets/nodata.png')
            :
            Column(
              children:  [
                const CategoriesView(),
                CourseCard(
              category: 'Math', 
              status: '46'.tr, 
              title: 'Math Bac', 
              description: 'learn all the units you need with the best revesion methodslearn all the units you need with the best revesion method', 
              teacher: 'Mr.Ahmed', 
              reviews: '4.5', 
              likes: '15',
              image: 'https://loremflickr.com/320/240/music?lock=2',
            ),
                CourseCard(
              category: 'Physics', 
              status: '47'.tr, 
              title: 'Physics Bac', 
              description: 'learn all the units you need with the best revesion methodslearn all the units you need with the best revesion method', 
              teacher: 'Ms.Amel', 
              reviews: '4.7', 
              likes: '35',
              image: 'https://images.unsplash.com/photo-1532264523420-881a47db012d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9',
            )
              ]
            )
            )
          ]
        )
      )
    );
    });
  }
}