import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhonemethodController extends GetxController{

 GlobalKey<FormState> key = GlobalKey<FormState>();

  checknumber(){
  if(key.currentState!.validate()){
  }
 }

}