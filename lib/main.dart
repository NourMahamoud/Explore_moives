import 'package:cinemax/Features/Auth/Login/presentation/login.dart';
import 'package:cinemax/Splach_Screen.dart';
import 'package:cinemax/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'Features/Homepage/home_page.dart';
import 'generated/Colors.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options:const FirebaseOptions(
        apiKey: 'AIzaSyCf1L4mQR5ZZ7eeHQ1rv2SI9DUlomB4cJs',
        appId: '1:501916655653:android:c4263f62112fab91619fcc',
        messagingSenderId: '666925191844:android:1756b0bab4a2c5c5248c31',
        projectId: 'movieapp-13ce5',
        storageBucket: 'movieapp-13ce5.firebasestorage.app',
      ) );

  runApp( MyApp());
}


class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  @override
  void initState(){
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('================================================User is currently signed out!');
      } else {

        print('User is signed in!');
      }
    });
    super.initState();
  }
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        cardColor:AppColors.searchParColor,
        textTheme: TextTheme(
          titleMedium: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
          bodySmall:TextStyle(color: Color(0xFF92929D),fontSize: 12,fontWeight: FontWeight.normal),
          bodyMedium: TextStyle(color: Color(0xFF92929D),fontSize: 15,fontWeight: FontWeight.normal),
        ) ,
        iconTheme: IconThemeData(

          color: Colors.white,
          size: 30 ,

        ),

      ),
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser ==   null  ? Onboarding(): SplachScreen() ,
    ) ;}}