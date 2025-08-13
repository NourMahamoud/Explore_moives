import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../core/firebase/firebaseAuth.dart';
import 'package:flutter/material.dart';

import '../../../Homepage/home_page.dart';
import '../../data/repositryIM.dart';
import '../../domain/use_case.dart';
class SignUp_Controller extends GetxController{
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController name;
  Authentication auth = Authentication();
  @override
  void onInit() {
    super.onInit();
    email = TextEditingController();
    password = TextEditingController();
    name = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
    name.dispose() ;
  }


  Future valdiate() async{
    if (email.text.isNotEmpty && password.text.isNotEmpty) {
      return await _Sign_up();
    } else if (email.text.isEmpty){
      return Get.defaultDialog(title:  'Error',middleText: 'Please enter your email') ;
    }else if (password.text.isEmpty){
      return Get.defaultDialog(title:  'Error',middleText: 'Please enter your Password') ;
    }else if (name.text.isEmpty){
      return Get.defaultDialog(title:  'Error',middleText: 'Please enter your Name') ;
    }
  }

  Future _Sign_up() async {
    final response = await Use_case(RepositryIm()).SignUp(email.text.trim(), password.text.trim(), name.text.trim()) ;
    response.fold((user)=> Get.offAll(HomePage()) ,(furai){
      print(furai.errMessage) ;
      print('Er===================================================================') ;
      Get.dialog(Dialog(
        child: Column(
          children: [
            Text(furai.errMessage),
            ElevatedButton(onPressed: (){
              Get.back() ;
            }, child: Text('ok'))
          ],
        ),
      )) ;
    });
  }
}