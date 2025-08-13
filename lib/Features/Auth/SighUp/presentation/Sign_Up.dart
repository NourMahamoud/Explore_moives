import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../generated/Colors.dart';
import '../../../../generated/ImagesAssets.dart';
import 'SignUp_controler.dart';

class SignUp_Page extends StatefulWidget {
  const SignUp_Page({super.key});

  @override
  State<SignUp_Page> createState() => _SignUp_PageState();
}

class _SignUp_PageState extends State<SignUp_Page> {
  SignUp_Controller controller = Get.put(SignUp_Controller()) ;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: AppColors.backGroundColor,
            child: SingleChildScrollView(
              child: Column(
                spacing: height * 0.035,
                children: [
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: height * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.asset(imagespath.logo, height: height * 0.3) ,
                  Padding(
                    padding: EdgeInsets.all(height * 0.012),
                    child: TextField(
                      controller: controller.name,
                      decoration: InputDecoration(
                        hintText: 'User Name',
                        label: Text(
                          'User Name ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: height * 0.025,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(height * 0.05),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(height * 0.012),
                    child: TextField(
                      controller:controller.email ,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        label: Text(
                          'Email',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: height * 0.025,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(height * 0.05),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(height * 0.012),
                    child: TextField(
                      controller: controller.password,
                      decoration: InputDecoration(
                        hintText: 'PassWord',
                        label: Text(
                          'PassWord',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: height * 0.025,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(height * 0.05),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(onPressed: controller.valdiate,child: Text('Sign Up ',style: TextStyle(color: Colors.white,fontSize: height * 0.025),),
                    style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.IndectorRectingle,
                    fixedSize: Size(width * 0.8, height * 0.06),
                  ),),
                ]
              ),
          
            )
          ),
        ),) ;
  }
}
