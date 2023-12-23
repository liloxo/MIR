import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../core/constants/firebaseinstance.dart';
import '../../../core/constants/savedvalues.dart';
import '../../../core/services/services.dart';
import 'package:share_plus/share_plus.dart';

class ProfileController extends GetxController {
  late String fullname;
  late String? email;
  MyServices myServices = Get.find();
  GoogleSignIn googlesignin = GoogleSignIn();
  String? image;

  imageuser()async{
    var userinfo = await FirebaseInstances.firebaseFirestore.collection('users').doc(SavedValues.id).get();
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
    email = FirebaseInstances.firebaseauth.currentUser?.email;
    imageuser();
    super.onInit();
  }
}