import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../constants/colors.dart';
import '../constants/sizes.dart';

class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 2,
      itemBuilder: (context,i){
        return Container(
        height: AppSize.height / 3.2,
        margin:
            EdgeInsets.only(bottom: Sizes.widthfifteen, top: Sizes.widthtwenty),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey)),
        child: Shimmer.fromColors(
            baseColor: AppColors.grey,
            highlightColor: AppColors.textWhite,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Containerwithdecoration(
                    width: AppSize.width / 7, height: Sizes.widthtwentyfive),
                Containerwithdecoration(
                    width: Sizes.widthfifty, height: Sizes.widthtwentyfive)
              ]),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Containerwithdecoration(
                    height: Sizes.widthtwentyfive,
                    width: AppSize.width / 4,
                    margin: EdgeInsets.only(top: Sizes.widthtwenty)),
                Containerwithdecoration(
                    height: Sizes.widthsixty,
                    margin: EdgeInsets.only(
                        bottom: Sizes.widthfifteen, top: Sizes.widthfifteen))
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(children: [
                  Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: AppSize.width / 7.8,
                      height: AppSize.width / 7.8,
                      child: const CircleAvatar(backgroundColor: Colors.grey)),
                  Containerwithdecoration(
                      height: Sizes.widthtwentyfive, width: AppSize.width / 3.2)
                ]),
                Containerwithdecoration(
                    height: Sizes.widthtwentyfive, width: Sizes.widthfifty)
              ])
            ])));
      }
    );
  }
}

class Containerwithdecoration extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  const Containerwithdecoration({
    super.key,
    this.width,
    this.height,
    this.margin,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey)),
        width: width,
        height: height,
        child: child);
  }
}
