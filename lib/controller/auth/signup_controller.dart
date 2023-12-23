import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mir/core/constants/firebaseinstance.dart';
import '../../core/services/services.dart';

class SignupController extends GetxController {

  //GoogleSignIn googlesignin = GoogleSignIn(clientId: webid);
  MyServices myServices = Get.find();
  String? token;
  //static String webid = '901405283129-1dsfvsd18oj2t7n7se5fqur0o92ooth1.apps.googleusercontent.com';

  gettoken()async{
    token = await FirebaseMessaging.instance.getToken();
  }

  Future signIn() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  if(googleUser == null){
   Get.defaultDialog(middleText: 'User not found');
   return null;
  }
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  await FirebaseInstances.firebaseauth.signInWithCredential(credential);
  DocumentReference<Map<String, dynamic>> docpath = FirebaseInstances.firebaseFirestore.collection('users').doc(googleUser.id);
  DocumentSnapshot<Map<String, dynamic>> res = await docpath.get();
  List? info = res.data()?['token'];
  if(res.exists){
    if(res.data()!['username']==null){
      savepref('2',googleUser.email,googleUser.id);
      Get.offAllNamed('userdetails');
    }else{
      myServices.sharedPreferences.setString('fullname', res.data()!['username']);
      savepref('3',googleUser.email,googleUser.id);
      Get.offAllNamed('home');
    }
    info?.add(token);
    await docpath.update({'token':info});
  }else{
    await docpath.set({
      'username': null,
      'city': null,
      'status':null,
      'imageurl': googleUser.photoUrl,
      'token': [token]
    });
    savepref('2',googleUser.email,googleUser.id);
    Get.offAllNamed('userdetails');
  }
}

 savepref(String step,String email,String id){
  myServices.sharedPreferences.setString('step', step);
  myServices.sharedPreferences.setString('email', email);
  myServices.sharedPreferences.setString('id', id);
  myServices.sharedPreferences.setString('token', token!);
 }

 @override
  void onInit() {
    gettoken();
    super.onInit();
  }

}


