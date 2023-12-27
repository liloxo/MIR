import 'package:get/get.dart';
import 'package:mir/core/middleware/mymiddleware.dart';
import 'package:mir/view/auth/phonemethod.dart';
import 'package:mir/view/auth/signup.dart';
import 'package:mir/view/home/home.dart';
import 'package:mir/view/pages/formations/formationdetails.dart';
import 'package:mir/view/pages/homepage/coursedetails/coursedetails.dart';
import 'package:mir/view/pages/homepage/homepage.dart';
import 'package:mir/view/onboarding/onboarding.dart';
import 'package:mir/view/pages/profile/contactus.dart';
import 'package:mir/view/pages/profile/personalinfo.dart';
import 'package:mir/view/pages/teacherpage/teacherpage.dart';
import 'package:mir/view/userdetails.dart/userdetails.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: '/', page: ()  => const OnBoarding(),middlewares: [MyMiddleWare()]),
  //=======================Auth===========================
  GetPage(name: '/signup'     , page: ()  => const SignUp()),
  GetPage(name: '/phonemethod', page: ()  => const PhoneMethod()),
  //=======================UserDetails====================
  GetPage(name: '/userdetails', page: ()  => const UserDetails()),
  //=======================Home===========================
  GetPage(name: '/home', page: ()  => const Home()),
  //=======================HomePage===========================
  GetPage(name: '/homepage'     , page: ()  => const HomePage()),
  GetPage(name: '/coursedetails', page: ()  => const CourseDetails()),
  //=======================Profile=========================
  GetPage(name: '/personalinfo', page: ()  => const PersonalInfo()),
  GetPage(name: '/contactus'   , page: ()  => const ContactUs()),
  //=======================Profile=========================
  GetPage(name: '/addformation'   , page: ()  => const TeacherPage()),
  //=======================Formation=======================
  GetPage(name: '/formationdetails', page: ()  => const FormationDetails()),

];