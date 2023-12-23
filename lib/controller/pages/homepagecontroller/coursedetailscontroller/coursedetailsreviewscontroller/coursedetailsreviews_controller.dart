import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mir/core/class/statusrequest.dart';
import 'package:mir/core/constants/colors.dart';
import '../../../../../core/constants/firebaseinstance.dart';
import '../../../../../core/constants/savedvalues.dart';
import '../../../../../data/model/reviews/reviewsmodel.dart';
import '../../../../../view/pages/homepage/coursedetails/coursedetailsreviews/makereview.dart';

class CoursedetailsReviewsController extends GetxController {

  late String formationid;
  bool ischeck = false;
  String? text;
  late StatusRequest statusRequest;
  List<ReviewsModel> reviewsmodel = [];
  CollectionReference<Map<String, dynamic>> coursesregistered = FirebaseInstances.firebaseFirestore.collection('courses').doc(SavedValues.id).collection('registeredformations');
  CollectionReference<Map<String, dynamic>> reviewsdata = FirebaseInstances.firebaseFirestore.collection('formations');
  int? length;
  double? averageStars;

  double calculateAverageStars() {
  if (reviewsmodel.isEmpty) {
    return 0.0; // Avoid division by zero
  }
  int? sum = reviewsmodel.map((review) => review.stars).reduce((value, element) => value! + element!);
  return sum! / reviewsmodel.length;
  }

  getdata(bool isupdate)async{
    statusRequest = StatusRequest.loading;
    update();
    QuerySnapshot<Map<String, dynamic>> data = await reviewsdata.doc(formationid).collection('reviews').get();
    if(data.docs.isEmpty){
     isupdate 
      ? await FirebaseInstances.firebaseFirestore.collection('formations').doc(formationid).update({'reviews':null})
      : null;
     statusRequest = StatusRequest.failure;
     update();
     return;
    }else{
      length = data.docs.length;
      reviewsmodel = data.docs.map((e) => ReviewsModel.fromJson(e.data(),DateFormat('d MMMM y').format(e.data()['date'].toDate()))).toList();
      averageStars = calculateAverageStars();
      isupdate 
      ? await FirebaseInstances.firebaseFirestore.collection('formations').doc(formationid).update({'reviews':averageStars})
      : null;
      statusRequest = StatusRequest.success;
      update();
    }
  }

  textupdate(bool? isreview){
    if(isreview == true){
      text = '68'.tr;
    }else{
      text = '67'.tr;
    }
    update();
  }
  checkreg() async {
    DocumentSnapshot<Map<String, dynamic>> check = await coursesregistered.doc(formationid).get();
    if(!check.exists){
      return null;
    }else{
     if(check.data()!['reserved'] == true){
       ischeck = true;
      textupdate(check.data()!['review']);
     }
    }
  } 

  makereview(){
    Get.bottomSheet(
      MakeReview(formationid: formationid),
      backgroundColor: AppColors.background
    );
  }
  editreview(){
    Get.bottomSheet(
      EditReview(formationid: formationid),
      backgroundColor: AppColors.background
    );
  }

 @override
  void onInit() {
    formationid = Get.arguments['formationid'];
    getdata(false);
    checkreg();
    super.onInit();
  }

}