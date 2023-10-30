import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/core/constants/colors.dart';
import 'package:mir/core/constants/sizes.dart';

class CourseCard extends StatelessWidget {
  final String category;
  final String status;
  final String title;
  final String description;
  final String teacher;
  final String reviews;
  final String likes;
  final String image;
  const CourseCard({Key? key, required this.category, required this.status, required this.title, required this.description, 
  required this.teacher, required this.reviews, required this.likes, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('coursedetails',arguments: {'image':image,'category':category,'title':title,'description':description,'teacher':teacher});
      },
      child: Container(
        height: AppSize.height / 3.2,
        margin: EdgeInsets.only(bottom: Sizes.widthfifteen),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.third)
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FirstRow(category: category, status: status),
              TitleDiscription(title: title, description: description),
              BottomRow(image: image, teacher: teacher, reviews: reviews, likes: likes)
            ]
        )
      )
    );
  }
}

class TitleDiscription extends StatelessWidget {
  const TitleDiscription({super.key,required this.title,required this.description});
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: const TextStyle(color: AppColors.black,fontSize: 20,fontWeight: FontWeight.w600),maxLines: 1,overflow: TextOverflow.ellipsis,),
        Container(
          margin: EdgeInsets.only(bottom: Sizes.widthfifteen,top: 5),
          child: Text(description,style: Theme.of(context).textTheme.bodyLarge,maxLines: 3))]);
  }
}

class BottomRow extends StatelessWidget {
  const BottomRow({ super.key,required this.image,required this.teacher,required this.reviews,required this.likes,});
  final String image;
  final String teacher;
  final String reviews;
  final String likes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 5,left: 5),
              width: Sizes.widthfifty,
              height: Sizes.widthfifty,
              child: Hero(
                tag: '${image}1',
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: 'https://loremflickr.com/320/240/music?lock=2',
                    fit: BoxFit.cover,
                   )),
              )
            ),
            SizedBox(
              width: AppSize.width / 3.2,
              child:  Text(teacher,style: const TextStyle(color: AppColors.black,fontSize: 16,fontWeight: FontWeight.w500,letterSpacing: 1),maxLines: 1)),
          ]
        ),
        Row(
          children: [
            Text(reviews),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: const Icon(Icons.star_border_outlined,color: AppColors.secondary,)),
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Text(likes),
            ),
            InkWell(
              onTap: () {},
              child: const Icon(Icons.favorite_border,color: AppColors.secondary,))
          ]
        )
      ]
    );
  }
}

class FirstRow extends StatelessWidget {
  const FirstRow({super.key, required this.category,required this.status,});
  final String category;
  final String status;
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(category,style: Theme.of(context).textTheme.bodyLarge),
        Container(
          padding: const EdgeInsets.fromLTRB(5,0,5,5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.secondary)
          ),
          child: Center(child: Text(status,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w600))),
        )
      ]
    );
  }
}