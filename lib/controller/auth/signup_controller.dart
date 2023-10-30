import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../core/services/services.dart';

class SignupController extends GetxController {

  GoogleSignIn googlesignin = GoogleSignIn(clientId: webid);
  MyServices myServices = Get.find();
  String? token;
  static String webid = '901405283129-1dsfvsd18oj2t7n7se5fqur0o92ooth1.apps.googleusercontent.com';
  
  Future signIn() async {
    GoogleSignInAccount? user = await googlesignin.signIn();
    if (user == null) {
      Get.defaultDialog(middleText: 'User not found');
      return;
    }
    else{
      var authh = await user.authentication;
      token = authh.idToken;
      print("==$token");
      myServices.sharedPreferences.setString('step', '2');
      myServices.sharedPreferences.setString('email', user.email);
      myServices.sharedPreferences.setString('token', token!);
      Get.offAllNamed('userdetails');
    }
  }

}


