import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/controller/pages/formationscontroller/formationdetails_controller.dart';
import '../../../core/constants/sizes.dart';
import 'formationcustombar.dart';

class FormationDetails extends StatelessWidget {
  const FormationDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormationdetailsController>(
      init: FormationdetailsController(),
      builder: (controller){
      return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          SizedBox(height: Sizes.widthtwentyfive),
          const CustomFormationBar(),
          Expanded(child: controller.pages.elementAt(controller.currentpage))
        ]));
    });
  }
}



