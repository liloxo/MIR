import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mir/core/functions/checkinternet.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constants/firebaseinstance.dart';
import '../../../core/constants/savedvalues.dart';
import '../../../core/functions/translatestring.dart';
import '../../../core/services/services.dart';
import '../../../data/model/homepage/formationmodel.dart';

class HomepageController extends GetxController {

  late String fullname;
  MyServices myServices = Get.find();
  List<RxBool> whentap = [];
  bool issearch = false;
  bool isloading = false;
  TextEditingController textEditingController = TextEditingController();
  Timer? debouncee;
  List<FormationModel> formationmodel = [];
  late StatusRequest statusRequest ;
  CollectionReference<Map<String, dynamic>> ress = FirebaseInstances.firebaseFirestore.collection('formations');
  List<String> searchFields = ['teacher', 'city', 'title'];
  CollectionReference<Map<String, dynamic>> favformations = FirebaseInstances.firebaseFirestore.collection('favorites').doc(SavedValues.id).collection('favoriteformations');

  getcat(String cat)async{ 
    QuerySnapshot<Map<String, dynamic>> data = await ress.where(translatecat(),isEqualTo: cat).get();
    if(data.docs.isEmpty){
      statusRequest = StatusRequest.failure;
      update();
      return;
    }else{
      QuerySnapshot<Map<String, dynamic>> favoritesSnapshot = await favformations.get();
      Map<String, bool> favoriteStatusMap = {};
      for (QueryDocumentSnapshot<Map<String, dynamic>> favoriteDoc in favoritesSnapshot.docs) {
       favoriteStatusMap[favoriteDoc.id] = true;
      }
      formationmodel = data.docs.map((e) {
      String formationId = e.id;
      bool isFavorite = favoriteStatusMap.containsKey(formationId);
      return FormationModel.fromJson(e.data(), e.id)..isfav = isFavorite;
      }).toList();
      statusRequest = StatusRequest.success;
      update();
    }
  }

  favoritetap(bool isfav,int i)async{
    if(!await checkInternet()){
     internetSnackbar();
     return;
    }else{
      String? id = formationmodel[i].id;
      DocumentReference<Map<String, dynamic>> dd = favformations.doc(id);
      formationmodel[i].isfav = !formationmodel[i].isfav!;
      formationmodel[i].favorites = isfav ? formationmodel[i].favorites! - 1 : formationmodel[i].favorites! + 1;
      update();
      if(isfav == false){
        await dd.set({ 'formationid':id});
        await ress.doc(id).update({'favorites': formationmodel[i].favorites! });
      }else{
        await dd.delete();
        await ress.doc(id).update({'favorites': formationmodel[i].favorites! });
      }
    }
  }

  getdataformations()async{
    statusRequest = StatusRequest.loading;
    update();
    QuerySnapshot<Map<String, dynamic>> data = await ress.get();
    if(data.docs.isEmpty){
      statusRequest = StatusRequest.failure;
      update();
      return;
    }else {
    // Fetch favorite formations once to reduce Firestore queries
    QuerySnapshot<Map<String, dynamic>> favoritesSnapshot = await favformations.get();
    // Map of formation IDs to their favorite status
    Map<String, bool> favoriteStatusMap = {};
    for (QueryDocumentSnapshot<Map<String, dynamic>> favoriteDoc in favoritesSnapshot.docs) {
      favoriteStatusMap[favoriteDoc.id] = true;
    }
    // Update FormationModel instances with favorite status
    formationmodel = data.docs.map((e) {
      String formationId = e.id;
      bool isFavorite = favoriteStatusMap.containsKey(formationId);
      return FormationModel.fromJson(e.data(), e.id)..isfav = isFavorite;
    }).toList();
    statusRequest = StatusRequest.success;
  }
    update();
  }
  
  getResults(String searchTerm) async {
  statusRequest = StatusRequest.loading;
  update();
  List<QuerySnapshot<Map<String, dynamic>>> results = [];
  for (String field in searchFields) {
    QuerySnapshot<Map<String, dynamic>> data = await FirebaseInstances.firebaseFirestore
        .collection('formations')
        .where(field, isGreaterThanOrEqualTo: searchTerm)
        .where(field, isLessThan: '${searchTerm}z')
        .get();
    results.add(data);
  }
  // Fetch favorited formation IDs
  QuerySnapshot<Map<String, dynamic>> favoritesSnapshot = await favformations.get();
  Set<String> favoritedIds = Set.from(favoritesSnapshot.docs.map((doc) => doc.id));
  // Merge the results and remove duplicates
  formationmodel = _mergeQuerySnapshots(results, favoritedIds);
  if(formationmodel.isEmpty){
   statusRequest = StatusRequest.failure;
  }else{
   statusRequest = StatusRequest.success;
  }
  update();
}

  List<FormationModel> _mergeQuerySnapshots(List<QuerySnapshot<Map<String, dynamic>>> snapshots, Set<String> favoritedIds) {
  List<FormationModel> mergedDocs = [];
  for (var snapshot in snapshots) {
    for (var doc in snapshot.docs) {
      String formationId = doc.id;
      bool isFavorite = favoritedIds.contains(formationId);
      FormationModel formation = FormationModel.fromJson(doc.data(), formationId)..isfav = isFavorite;
      // Check if the formation already exists to avoid duplicates
      if (!mergedDocs.any((element) => element.id == formation.id)) {
        mergedDocs.add(formation);
      }
    }
  }
  return mergedDocs;
  }

  searchchange(String? value){
    if (debouncee?.isActive ?? false) debouncee!.cancel();
    if(value == "" || value!.isEmpty){
      getdataformations();
      update();
      return;
    }else{
      debouncee = Timer(const Duration(seconds: 1),(){
        getResults(value);
        update();
      });
    }
  }
  List cat = [
    '51'.tr,'52'.tr,'53'.tr,'54'.tr,'55'.tr,'56'.tr,'57'.tr 
  ];
  toupd(){
    cat = [
    '51'.tr,'52'.tr,'53'.tr,'54'.tr,'55'.tr,'56'.tr,'57'.tr 
    ];
    update();
  }
  void tapcat(int i,String cat) {
    if(whentap[i].value == true){
      getdataformations();
      whentap[i].value = false;
    }else{
      for (var element in whentap) {element.value = false; }
      whentap[i].value = !whentap[i].value;
      getcat(cat);
    }
    update();
  }

  @override
  void onInit() {
    fullname = myServices.sharedPreferences.getString('fullname')!;
    whentap = List<RxBool>.generate(cat.length, (index) => false.obs);
    getdataformations();
    super.onInit();
  }

  @override
  void dispose() {
    debouncee?.cancel();
    super.dispose();
  }
}