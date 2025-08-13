import 'package:cinemax/Features/Homepage/data/data_Source/remote_data.dart';
import 'package:cinemax/Features/Homepage/domain/Entity/Entitiy.dart';
import 'package:cinemax/Features/Homepage/domain/Use_Case/useCase.dart';
import 'package:cinemax/Features/Homepage/presentation/Account.dart';
import 'package:cinemax/Features/Homepage/presentation/HomePageController.dart';
import 'package:cinemax/Features/Homepage/presentation/SearchPage.dart';
import 'package:cinemax/Features/Homepage/presentation/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/Data/Api/End_piont.dart';
import '../../generated/Colors.dart';
import '../../generated/ImagesAssets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 final HomePageController controller = Get.put(HomePageController()) ;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
           backgroundColor: AppColors.homePageColor,
      bottomNavigationBar: GetBuilder<HomePageController>(
        builder: (con) {
          return BottomNavigationBar(items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home',),
            BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Account'),
          ] ,
            selectedItemColor: AppColors.IconNavagition,
            backgroundColor: AppColors.NavagitionBottom,
             currentIndex: con.page,
          //fixedColor: AppColors.IconNavagition,

            onTap: (index){
            con.changePage(index) ;

            },
          );
        }
      ),
      body: SafeArea(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          onPageChanged: (index){
            controller.changePage(index) ;
          },
          children: [
          home() ,
          Searchpage() ,
          Account() ,
        ],),
    ));
  }
}
// /======================================================
// IconButton(onPressed: (){}, icon: Icon()),
// InkWell() ,
// Card () ,
// ListTile() ,
// Checkbox(value: value, onChanged: onChanged) ,
// SegmentedButton(segments: segments, selected: selected) ,
// FloatingActionButton(onPressed: onPressed) ,
