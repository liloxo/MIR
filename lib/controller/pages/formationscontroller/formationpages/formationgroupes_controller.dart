import 'package:get/get.dart';
import 'package:mir/core/class/statusrequest.dart';
import 'package:mir/core/constants/firebaseinstance.dart';

import '../../../../core/functions/translatestring.dart';
import '../../../../data/model/homepage/formationmodel.dart';
import '../../addformationcontroller/addformation_controller.dart';

class FormationgroupesController extends GetxController {
  
  late FormationModel formationmodel;
  List<GroupController> groupControllers = [];  
  late StatusRequest statusRequest;

  changeswitch(int i,bool value){
   groupControllers[i].isstatus = value;
   if(value == true){
    groupControllers[i].status = '46'.tr;
   }else{
    groupControllers[i].status = '47'.tr;
   }
   update();
  }

  getdata()async{
    statusRequest = StatusRequest.loading;
    update();
    for (var i = 1; i <= formationmodel.groupes!; i++) {
    var data = await FirebaseInstances.firebaseFirestore.collection('formations').doc(formationmodel.id).collection('register').doc('groupe$i').get();
    GroupController groupController = GroupController();
    if (data.exists) {
      groupController.timeController.text = data['duration'] ?? '';
      groupController.priceController.text = data['price'] ?? '';
      groupController.seatsController.text = data['seats']?.toString() ?? '';
      groupController.status = data['status'] == "Available" ? '46'.tr : '47'.tr ;
      groupController.isstatus = data['status'] == 'Available' ? true : false; 
    }
    groupControllers.add(groupController);
    }
    statusRequest = StatusRequest.success;
    update();
  }

  updategroupes(String? path,String? price,String? time,int? seats,String? status)async{
    await FirebaseInstances.firebaseFirestore.collection('formations').doc(formationmodel.id).collection('register').doc(path).update({
      'duration': time,
      'price': price,
      'seats': seats,
      'status': translatestatus(status!,'en')
    });
  }
  updatestatus(String? path,String status)async{
    await FirebaseInstances.firebaseFirestore.collection('formations').doc(formationmodel.id).collection('register').doc(path).update({
      'status': status,
    });
  }


  @override
  void onInit() {
    formationmodel = Get.arguments['formationmodel'];
    getdata();
    super.onInit();
  }
}