import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/controller/pages/formationscontroller/formationpages/formationstudents_controller.dart';
import 'package:mir/view/pages/formations/formationcustombar.dart';
import '../../../../../core/constants/sizes.dart';

class FormationStudents extends StatelessWidget {
  const FormationStudents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormationstudentsController>(
      init: FormationstudentsController(),
      builder: (controller){
      return Column(
        children: [
          SizedBox(height: Sizes.widthtwentyfive),
          const CustomRequestsBar(),
          Expanded(child: controller.pages.elementAt(controller.currentpage))
        ]
      );
    });
  }
}