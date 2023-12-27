import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mir/core/class/statusrequest.dart';
import 'package:mir/core/constants/firebaseinstance.dart';
import 'package:mir/core/constants/savedvalues.dart';
import 'package:mir/data/model/homepage/formationmodel.dart';

class FormationsController extends GetxController {

  late StatusRequest statusRequest;
  List<FormationModel> formationmodel = [];

  getdata() async {
    statusRequest = StatusRequest.loading;
    update();
    QuerySnapshot<Map<String, dynamic>> data = await FirebaseInstances.firebaseFirestore.collection('formations').where('userid',isEqualTo: SavedValues.id).get();
    if(data.docs.isEmpty){
     statusRequest = StatusRequest.failure;
     update();
     return;
    }else{
      formationmodel = data.docs.map((e) => FormationModel.fromJson(e.data(), e.id)).toList();
      statusRequest = StatusRequest.success;
      update();
    }
  }

  @override
  void onInit() {
    getdata();
    super.onInit();
  }

}