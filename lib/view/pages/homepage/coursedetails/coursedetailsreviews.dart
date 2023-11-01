import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/core/constants/colors.dart';
import 'package:mir/core/constants/sizes.dart';

class CourseDetailsReviews extends StatelessWidget {
  const CourseDetailsReviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Sizes.widthtwenty,vertical: 10),
      child: ListView(
        padding: EdgeInsets.zero,
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
                child: Text('4.5',style:  TextStyle(color: AppColors.black,fontSize: 20,fontWeight: FontWeight.values[5],letterSpacing: 1),)),
              Text("(100 ${'45'.tr})",style:  TextStyle(color: AppColors.black,fontSize: 20,fontWeight: FontWeight.values[4],letterSpacing: 1),),
            ]
           )
         ),
         const Studentreview(studentname: 'Ivan Yosha',studentreview: 'The course was comprehensive and covered everything i needed to know about Math',datereview: '31 Oct 2023'),
         const Studentreview(studentname: 'Kina Nastya',studentreview: "The instructor's real world examples and hands on approach made it a valuable learning experience",datereview: '30 Oct 2023'),
        ]
      )
    );
  }
}

class Studentreview extends StatelessWidget {
  final String studentname;
  final String studentreview;
  final String datereview;
  const Studentreview({super.key, required this.studentname, required this.studentreview, required this.datereview});

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
           Text(studentname,style: const TextStyle(fontSize: 18,color: AppColors.black,fontWeight: FontWeight.w500,letterSpacing: 1)),
           Row(children: const [
             Icon(Icons.star,color: Colors.yellow,size: 22,),
             Icon(Icons.star,color: Colors.yellow,size: 22,),
             Icon(Icons.star,color: Colors.yellow,size: 22,),
             Icon(Icons.star,color: Colors.yellow,size: 22,),
             Icon(Icons.star,color: Colors.yellow,size: 22,),
           ])
         ]),
         Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Text(datereview,style: const TextStyle(fontSize: 16,color: AppColors.grey,fontWeight: FontWeight.w600))),
         Text(studentreview,style: const TextStyle(fontSize: 14,color: AppColors.grey,fontWeight: FontWeight.w500)),
        
       ],
      ),
    );
  }
}