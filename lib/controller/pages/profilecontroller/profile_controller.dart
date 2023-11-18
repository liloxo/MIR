import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../core/constants/savedvalues.dart';
import '../../../core/services/services.dart';
import 'package:share_plus/share_plus.dart';

class ProfileController extends GetxController {
  late String fullname;
  late String? email;
  MyServices myServices = Get.find();
  GoogleSignIn googlesignin = GoogleSignIn();
  User? firebaseAuth = FirebaseAuth.instance.currentUser;
  CollectionReference<Map<String, dynamic>> firebasefirestore = FirebaseFirestore.instance.collection('users');
  String? image;

  imageuser()async{
    var userinfo = await firebasefirestore.doc(SavedValues.id).get();
    image = userinfo.data()!['imageurl'];
    update();
  }

  shareapp(){
    Share.share('com.example.mir');
  }

  signout() async {
    await myServices.sharedPreferences.clear();
    await myServices.sharedPreferences.setString('step', '1');
    await googlesignin.disconnect();
    Get.offAllNamed('signup');
  }

  @override
  void onInit() {
    fullname = myServices.sharedPreferences.getString('fullname')!;
    email = firebaseAuth?.email;
    imageuser();
    super.onInit();
  }
}