import 'dart:async';
import 'package:cinemax/Features/Auth/Login/presentation/login.dart';
import 'package:cinemax/Features/Homepage/domain/Use_Case/useCase.dart';
import 'package:cinemax/Features/Homepage/home_page.dart';
import 'package:cinemax/Features/ShowFilm/data/data_source/remote_source.dart';
import 'package:cinemax/generated/Colors.dart';
import 'package:cinemax/generated/ImagesAssets.dart';
import 'package:flutter/material.dart' ;
import 'package:get/get.dart';

import 'Features/Homepage/presentation/HomePageController.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
     final HomePageController controller = Get.put(HomePageController()) ;
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), ()async{
     // controller.getAllFilm() ;
      //Remote_DataSource().detilesMovie(755898) ;
         Get.off(HomePage());

    }) ;
    return Scaffold(
      body: Container(decoration: BoxDecoration(
        color: AppColors.backGroundColor,
        image: DecorationImage(image: AssetImage(imagespath.BackgroundImage),fit: BoxFit.cover),
      ),),
    );
  }
}
