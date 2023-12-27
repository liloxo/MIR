import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../../../core/class/statusrequest.dart';
import '../../../../core/constants/firebaseinstance.dart';
import '../../../../data/model/homepage/formationmodel.dart';

class FormationrequestsController extends GetxController {

  late FormationModel formationmodel;
  List<GroupeStudents> groupestudents = [];
  late StatusRequest statusRequest;
  late CollectionReference<Map<String, dynamic>> regcollection ;
  late CollectionReference<Map<String, dynamic>> coursecollection ;

  acceptstudent(int i)async{
    await regcollection.doc(groupestudents[i].groupeid).collection('students').doc(groupestudents[i].docid).update({
      'reserved':true
    });
    await coursecollection.doc(groupestudents[i].id).collection('registeredformations').doc(formationmodel.id).update({
      'reserved':true
    });
    var data = await regcollection.doc(groupestudents[i].groupeid).get();
    int? reserv = data.data()!['reserved'];
    await regcollection.doc(groupestudents[i].groupeid).update({
      'reserved':reserv! + 1
    });
    groupestudents.removeAt(i);
    if(groupestudents.isEmpty){
     statusRequest = StatusRequest.failure;
    }
    update();
  }

  declinestudent(int i)async{
    await regcollection.doc(groupestudents[i].groupeid)
    .collection('students').doc(groupestudents[i].docid).delete();
    await coursecollection.doc(groupestudents[i].id).collection('registeredformations').doc(formationmodel.id).delete();
    groupestudents.removeAt(i);
    if(groupestudents.isEmpty){
     statusRequest = StatusRequest.failure;
    }
    update();
  }

  getdata()async{
    statusRequest = StatusRequest.loading;
    update();
    for (var i = 1 ; i <= formationmodel.groupes!; i++) {
      GroupeStudents? groupeStudent ;
      var data = await FirebaseInstances.firebaseFirestore.collection('formations').doc(formationmodel.id).collection('register').doc('groupe$i')
      .collection('students')
      .where('reserved',isEqualTo: false).get();
      for (var ii in data.docs) {
        groupeStudent = GroupeStudents.fromJson(ii.data(),'groupe$i',ii.id);
        groupestudents.add(groupeStudent);
      }
    }
    if(groupestudents.isEmpty){
     statusRequest = StatusRequest.failure;
    }else{
      statusRequest = StatusRequest.success;
    }
    update();
  }

  @override
  void onInit() {
    formationmodel = Get.arguments['formationmodel'];
    regcollection = FirebaseInstances.firebaseFirestore.collection('formations').doc(formationmodel.id).collection('register');
    coursecollection = FirebaseInstances.firebaseFirestore.collection('courses');
    getdata();
    super.onInit();
  }
 
}

class GroupeStudents {
  String? id;
  String? docid;
  String? name;
  String? email;
  String? groupeid;

  GroupeStudents.fromJson(Map<String, dynamic> json,String this.groupeid,String this.docid) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }
}