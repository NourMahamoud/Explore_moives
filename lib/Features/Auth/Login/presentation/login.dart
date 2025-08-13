import 'package:cinemax/Features/Auth/Login/presentation/control_login.dart';
import 'package:cinemax/core/Data/Api/Dio_Consumer.dart';
import 'package:cinemax/generated/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../generated/ImagesAssets.dart';

class Login extends StatefulWidget {
  Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Login_Page_Controller controller = Get.put(Login_Page_Controller());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: height * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(imagespath.logo, height: height * 0.3),
                Padding(
                  padding: EdgeInsets.all(height * 0.012),
                  child: TextField(
                    controller: controller.email,
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
                      counter: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(color: AppColors.IndectorRectingle),
                        ),
                      ),
                      hintText: 'Password',
                      label: Text(
                        'Password',
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
                ElevatedButton(
                  onPressed: controller.valdiate ,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.IndectorRectingle,
                    fixedSize: Size(width * 0.8, height * 0.06),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: height * 0.025,
                    ),
                  ),
                ),
        
                ElevatedButton(
                  onPressed: controller.signup,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.IndectorRectingle,
                    fixedSize: Size(width * 0.8, height * 0.06),
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: height * 0.025,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: controller.signup,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.IndectorRectingle,
                    fixedSize: Size(width * 0.8, height * 0.06),
                  ),
                  child: Text(
                    'Login as Guest User',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: height * 0.025,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
