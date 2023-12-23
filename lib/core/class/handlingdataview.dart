import 'package:flutter/material.dart';
import 'package:mir/core/class/statusrequest.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  final Widget nodatawidget;
  final Widget loading;
  const HandlingDataView(
    {Key? key, required this.statusRequest, required this.widget, required this.nodatawidget, required this.loading})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
      ? loading
      : statusRequest == StatusRequest.offlinefailure
          ? const ImageStatus(image: 'assets/nointernet.png')
          : statusRequest == StatusRequest.serverfailure
              ? const ImageStatus(image: 'assets/noconnection.png')
              : statusRequest == StatusRequest.failure
                  ? nodatawidget
                  : widget;
  }
}

class ImageStatus extends StatelessWidget {
  final String image;
  const ImageStatus({
    super.key, required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return  Center(child: Image.asset(image),
    );
  }
}