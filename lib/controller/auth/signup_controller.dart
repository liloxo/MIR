import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mir/core/constants/firebaseinstance.dart';
import '../../core/functions/translatestring.dart';
import '../../core/services/services.dart';
import '../../../core/class/statusrequest.dart';


class SignupController extends GetxController {

  //GoogleSignIn googlesignin = GoogleSignIn(clientId: webid);
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  //static String webid = '901405283129-1dsfvsd18oj2t7n7se5fqur0o92ooth1.apps.googleusercontent.com';

  Future signIn() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  if(googleUser == null){
   Get.defaultDialog(middleText: 'User not found');
   return null;
  }
  statusRequest = StatusRequest.loading;
  update();
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  await FirebaseInstances.firebaseauth.signInWithCredential(credential);
  DocumentReference<Map<String, dynamic>> docpath = FirebaseInstances.firebaseFirestore.collection('users').doc(googleUser.id);
  DocumentSnapshot<Map<String, dynamic>> res = await docpath.get();
  if(res.exists){
    if(res.data()!['username']==null){
      savepref('2',googleUser.email,googleUser.id);
      Get.offAllNamed('userdetails');
    }else{
      myServices.sharedPreferences.setString('fullname', res.data()!['username']);
      myServices.sharedPreferences.setString('status', translatestat(res.data()!['status']));
      savepref('3',googleUser.email,googleUser.id);
      Get.offAllNamed('home');
    }
  }else{
    await docpath.set({
      'username': null,
      'city': null,
      'status':null,
      'imageurl': googleUser.photoUrl,
    });
    savepref('2',googleUser.email,googleUser.id);
    statusRequest = StatusRequest.success;
    update();
    Get.offAllNamed('userdetails');
  }
}

 savepref(String step,String email,String id){
  myServices.sharedPreferences.setString('step', step);
  myServices.sharedPreferences.setString('email', email);
  myServices.sharedPreferences.setString('id', id);
 }

}


