import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mir/core/constants/savedvalues.dart';
import 'package:mir/core/functions/checkinternet.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constants/firebaseinstance.dart';
import '../../../data/model/homepage/formationmodel.dart';

class FavoriteController extends GetxController {

  late StatusRequest statusRequest ;
  List<FormationModel>? formationmodel = [];
  CollectionReference<Map<String, dynamic>> favoriteformations = FirebaseInstances.firebaseFirestore.collection('favorites').doc(SavedValues.id).collection('favoriteformations');

  favoritetap(int i) async {
    if (i >= 0 && i < formationmodel!.length) {
      String? id = formationmodel![i].id;
      await favoriteformations.doc(id).delete();
      await FirebaseInstances.firebaseFirestore.collection('formations').doc(id).update({'favorites': formationmodel![i].favorites! -1});
      formationmodel!.removeAt(i);
      update();
    if (formationmodel!.isEmpty) {
      statusRequest = StatusRequest.failure;
      update();
    }
    }
  }

 getdataformations()async{
  statusRequest = StatusRequest.loading;
    update();
    if(!await checkInternet()){
      statusRequest = StatusRequest.offlinefailure;
      update();
      return;
    }else{
      
    QuerySnapshot<Map<String, dynamic>> data = await favoriteformations.get();
    if(data.docs.isEmpty){
      statusRequest = StatusRequest.failure;
      update();
      return;
    }else{
      List<FormationModel> favoriteFormations = [];
      for (var i in data.docs) {
       DocumentSnapshot<Map<String, dynamic>> dd = await FirebaseInstances.firebaseFirestore.collection('formations').doc(i.id).get();
      if (dd.exists) {
        // Assuming FormationModel.fromJson is used to create FormationModel instances
        FormationModel favoriteFormation = FormationModel.fromJson(dd.data()!, i.id);
        favoriteFormations.add(favoriteFormation);
      }
      }
    // Update the 'formationmodel' list with the retrieved favorite formations
    formationmodel = favoriteFormations;
      statusRequest = StatusRequest.success;
      update();
    }
    }
  }

  @override
  void onInit() {
    getdataformations();
    super.onInit();
  }

}