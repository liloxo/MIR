import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mir/core/constants/firebaseinstance.dart';
import 'package:mir/core/constants/savedvalues.dart';
import 'package:mir/core/functions/checkinternet.dart';
import 'package:mir/data/model/courses/coursesmodel.dart';
import '../../../core/class/statusrequest.dart';
import '../../../data/model/homepage/formationmodel.dart';

class CoursesController extends GetxController {

  late StatusRequest statusRequest ;
  List<FormationModel>? formationmodel = [];
  List<CoursesModel> coursesmodel = [];
  CollectionReference<Map<String, dynamic>> coursesregistered = FirebaseInstances.firebaseFirestore.collection('courses').doc(SavedValues.id).collection('registeredformations');

 getcourses()async{
    statusRequest = StatusRequest.loading;
    update();
    if(!await checkInternet()){
      statusRequest = StatusRequest.offlinefailure;
      update();
      return;
    }else{
      QuerySnapshot<Map<String, dynamic>> data = await coursesregistered.get();
    if(data.docs.isEmpty){
      statusRequest = StatusRequest.failure;
      update();
      return;
    }else{
      coursesmodel = data.docs.map((e) => CoursesModel.fromJson(e.data())).toList();
      List<FormationModel> coursesregistered = [];
    for (var i in data.docs) {
      DocumentSnapshot<Map<String, dynamic>> dd = await FirebaseInstances.firebaseFirestore.collection('formations').doc(i.id).get();
      if (dd.exists) {
        FormationModel favoriteFormation = FormationModel.fromJson(dd.data()!, i.id);
        coursesregistered.add(favoriteFormation);
      }
    }
    formationmodel = coursesregistered;
      statusRequest = StatusRequest.success;
      update();
    }
    }
  }

 @override
  void onInit() {
    getcourses();
    super.onInit();
  }

}