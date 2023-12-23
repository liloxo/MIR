import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mir/controller/pages/homepagecontroller/coursedetailscontroller/coursedetailsreviewscontroller/coursedetailsreviews_controller.dart';
import 'package:mir/core/class/statusrequest.dart';
import 'package:mir/core/constants/firebaseinstance.dart';
import 'package:mir/core/constants/savedvalues.dart';

class MakereviewController extends GetxController {
  
  List<RxBool> whentap = [];
  List<int> cat = [ 1,2,3,4,5];
  TextEditingController textEditingController = TextEditingController();
  bool isEmpty = true;
  int? star;
  CoursedetailsReviewsController coursedetailsReviewsController = Get.put(CoursedetailsReviewsController());

  void tapcat(int i) {
    if(whentap[i].value == true){
      whentap[i].value = false;
      star = null;
      isEmpty = true;
    }else{
      for (var element in whentap) {element.value = false; }
      whentap[i].value = !whentap[i].value;
      star = i+1;
      isEmpty = false;
    }
    update();
  }

  submitreview(String formationid) async {
    await FirebaseInstances.firebaseFirestore.collection('formations').doc(formationid).collection('reviews').doc(SavedValues.id).set({
      'stars':star,
      'review': textEditingController.text,
      'username': SavedValues.username,
      'date': DateTime.now(),
    });
    await FirebaseInstances.firebaseFirestore.collection('courses').doc(SavedValues.id).collection('registeredformations').doc(formationid).update({'review':true});
    coursedetailsReviewsController.textupdate(true);
    coursedetailsReviewsController.getdata(true);
    Get.back();
  }
  
  @override
  void onInit() {
    whentap = List<RxBool>.generate(cat.length, (index) => false.obs);
    super.onInit();
  }
}

class EditreviewController extends GetxController {

  late final String formationid;
  EditreviewController({required this.formationid});
  List<RxBool> whentap = [];
  List<int> cat = [ 1,2,3,4,5];
  TextEditingController textEditingController = TextEditingController();
  bool isEmpty = false;
  late int star;
  String? review;
  late StatusRequest statusRequest;
  late DocumentReference<Map<String, dynamic>> coursesregistered ;
  CoursedetailsReviewsController coursedetailsReviewsController = Get.put(CoursedetailsReviewsController());

  getdata()async{
    statusRequest = StatusRequest.loading;
    update();
    DocumentSnapshot<Map<String, dynamic>> check = await coursesregistered.get();
    review = check.data()!['review'];
    star = check.data()!['stars'];
    whentap[star-1].value = true;
    textEditingController = TextEditingController(text: review);
    statusRequest = StatusRequest.success;
    update();
  }

  editreview()async{
    await coursesregistered.set({
      'stars':star,
      'review': textEditingController.text,
      'username': SavedValues.username,
      'date': DateTime.now(),
    });
    coursedetailsReviewsController.getdata(true);
    Get.back();
  }

  deletereview()async{
    await coursesregistered.delete();
    await FirebaseInstances.firebaseFirestore.collection('courses').doc(SavedValues.id).collection('registeredformations').doc(formationid).update({'review':false});
    coursedetailsReviewsController.textupdate(false);
    coursedetailsReviewsController.getdata(true);
    Get.back();
  }

  void tapcat(int i) {
    if(whentap[i].value == true){
      whentap[i].value = false;
      isEmpty = true;
    }else{
      for (var element in whentap) {element.value = false; }
      whentap[i].value = !whentap[i].value;
      star = i+1;
      isEmpty = false;
    }
    update();
  }

  @override
  void onInit() {
    coursesregistered =  FirebaseInstances.firebaseFirestore.collection('formations').doc(formationid).collection('reviews').doc(SavedValues.id);
    getdata();
    whentap = List<RxBool>.generate(cat.length, (index) => false.obs);
    super.onInit();
  }

}