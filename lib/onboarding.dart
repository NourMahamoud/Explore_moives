import 'dart:async';
import 'dart:developer' as developer;

import 'package:cinemax/core/Errors/NetworkErrors.dart';
import 'package:cinemax/generated/AppText.dart';
import 'package:cinemax/generated/Colors.dart';
import 'package:cinemax/generated/ImagesAssets.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Features/Auth/Login/presentation/login.dart';
import 'core/Conection/Network_Info.dart';


class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
 late PageController controler ;
 List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];
 final Connectivity _connectivity = Connectivity();
 late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Conectivity.connectivty_checker(context);
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    controler =PageController() ;
  }
 Future<void> initConnectivity() async {
   late List<ConnectivityResult> result;
   // Platform messages may fail, so we use a try/catch PlatformException.
   try {
     result = await _connectivity.checkConnectivity();
   } on PlatformException catch (e) {
     developer.log('Couldn\'t check connectivity status', error: e);
     return;
   }
   if (!mounted) {
     return Future.value(null);
   }

   return _updateConnectionStatus(result);
 }

 Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
   setState(() {
     _connectionStatus = result;
   });
   // ignore: avoid_print
   print('nul ya kalp akof=====================================================================================') ;

   if (_connectionStatus.first == ConnectivityResult.none){
     Networkhandle_erorrs.showMyDialog(context) ;
  }
 }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controler.dispose() ;
    _connectivitySubscription.cancel();
  }
  @override

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: PageView(

          scrollBehavior:ScrollBehavior() ,
          controller: controler,
          children: [
            Container(
            color: AppColors.backGroundColor,
            height: height * 0.9,
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset(
                      imagespath.BackgroundImage,

                    ),
                    Container(

                      margin: EdgeInsets.all(40),
                      height: height * 0.40,
                      width: double.infinity,


                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Column(

                        spacing:20 ,

                        children: [
                          const SizedBox(height: 20,) ,
                          Text(AppText.firstTitleOnbording,style:const TextStyle(color: Colors.white,fontWeight:FontWeight.bold ,fontSize: 20),),
                          const Text(AppText.firstSupTitleOnbording,style: TextStyle(color: Colors.grey),textAlign: TextAlign.center,) ,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                            SmoothPageIndicator(controller:controler,
                              count: 3,
                              effect: ExpandingDotsEffect(
                                dotColor: AppColors.IndectorElipilce,
                                activeDotColor: AppColors.IndectorRectingle ,
                                radius: 1,

                              ),),

                                  Container(width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF00D8FF), // Cyan color
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child:  IconButton(onPressed: (){
                                      controler.nextPage(duration: Duration(seconds: 1), curve:Curves.bounceIn) ;
                                    },
                                     icon: Icon(Icons.arrow_forward_ios,
                                       size: 20,
                                       color: Colors.black,)
                                    ),
                                  ),
                              ],)

                          ],) ,
                    ),
                  ],
                ),
              ],
            ),
          ),
            Container(
            color: AppColors.backGroundColor,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround ,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(imagespath.onbardingImage2
                      ,height: 0.5*height,fit:BoxFit.contain,),
                    Image.asset(
                      imagespath.onbardingImage1,
                      height: 0.4*height,

                    ),


                  ],
                ),  Container(

                  margin: EdgeInsets.all(40),
                  height: height * 0.40,
                  width: double.infinity,


                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Column(

                    spacing:20 ,

                    children: [
                      const SizedBox(height: 20,) ,
                      Text(AppText.ScoundTitleOnbording,style:const TextStyle(color: Colors.white,fontWeight:FontWeight.bold ,fontSize: 20),textAlign: TextAlign.center,),
                      const Text(AppText.firstSupTitleOnbording,style: TextStyle(color: Colors.grey),textAlign: TextAlign.center,) ,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SmoothPageIndicator(controller:controler,
                            count: 3,
                            effect: ExpandingDotsEffect(
                              dotColor: AppColors.IndectorElipilce,
                              activeDotColor: AppColors.IndectorRectingle ,
                              radius: 1,

                            ),),

                          Container(width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: const Color(0xFF00D8FF), // Cyan color
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child:  IconButton(onPressed: (){
                              controler.nextPage(duration: Duration(seconds: 1), curve:Curves.bounceIn) ;
                            },
                                icon: Icon(Icons.arrow_forward_ios,
                                  size: 20,
                                  color: Colors.black,)
                            ),
                          ),
                        ],)

                    ],) ,
                ),

              ],
            ),
          ),
            Container(
            color: AppColors.backGroundColor,
            height: height * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  imagespath.onbardingImage3,

                ),
                Container(

                  margin: EdgeInsets.all(40),
                  height: height * 0.40,
                  width: double.infinity,


                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Column(

                    spacing:20 ,

                    children: [
                      const SizedBox(height: 20,) ,
                      Text(AppText.thirdTitleOnbording,style:const TextStyle(color: Colors.white,fontWeight:FontWeight.bold ,fontSize: 20),textAlign: TextAlign.center,),
                      const Text(AppText.firstSupTitleOnbording,style: TextStyle(color: Colors.grey),textAlign: TextAlign.center,) ,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SmoothPageIndicator(controller:controler,
                            count: 3,
                            effect: ExpandingDotsEffect(
                              dotColor: AppColors.IndectorElipilce,
                              activeDotColor: AppColors.IndectorRectingle ,
                              radius: 1,

                            ),),

                          Container(width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: const Color(0xFF00D8FF), // Cyan color
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child:  IconButton(onPressed: (){
                              Get.offAll(Login()) ;
                            },
                                icon: Icon(Icons.arrow_forward_ios,
                                  size: 20,
                                  color: Colors.black,)
                            ),
                          ),
                        ],)

                    ],) ,
                ),
              ],
            ),
          ),
       ]),
      ),
    );
  }
}
