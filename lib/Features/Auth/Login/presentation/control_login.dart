import 'dart:convert';


import 'package:cinemax/Features/Auth/SighUp/presentation/Sign_Up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../core/firebase/firebaseAuth.dart';
import '../../../Homepage/home_page.dart' ;
import '../../data/repositryIM.dart';
import '../../domain/use_case.dart';
class Login_Page_Controller extends GetxController {
  late TextEditingController email;
  late TextEditingController password;
  Authentication auth = Authentication();
  @override
  void onInit() {
    super.onInit();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }


 Future valdiate() async{
    if (email.text.isNotEmpty && password.text.isNotEmpty) {
      return await logIn();
    } else if (email.text.isEmpty){
      return Get.defaultDialog(title:  'Error',middleText: 'Please enter your email') ;
    }else if (password.text.isEmpty){
      return Get.defaultDialog(title:  'Error',middleText: 'Please enter your Password') ;
    }
 }

  Future logIn() async {
    final response = await Use_case(RepositryIm()).SignIn(
        email.text.trim(), password.text.trim());
    response.fold((user)=> Get.offAll(HomePage()) ,(furai){
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

  Future signup() async {
    Get.to(SignUp_Page());
  }
}
  // Future<void> getRequestToken() async {
  //   final response = await http.get(
  //     Uri.parse('https://api.themoviedb.org/3/authentication/token/new'),
  //     headers: {
  //       'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhOWFjNmE4ZTBjOGZhZmQ4Y2EyZmI0ZDVjYWY0YTE1MiIsIm5iZiI6MTczOTkyMTMzNi42NzM5OTk4LCJzdWIiOiI2N2I1MTdiOGNmYjMzOGVjNWI1ODNjMTgiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.H6yZQ2FYYBEIuIC3pYxDdIwEl3IoNc7C1v3N-CLuUFU',
  //       'accept': 'application/json',
  //     },
  //   );
  //
  //   final data = json.decode(response.body);
  //   print('==========================================${data['request_token']}') ;
  //   return lunchtoconfirm(data['request_token']);
  // }
  //
  // Future lunchtoconfirm(String requestToken) async {
  //   final Uri uri = Uri.parse('https://www.themoviedb.org/authenticate/$requestToken?redirect_to=http://www.yourapp.com/approved');
  //
  //   print(uri.data) ;
  //   if (await canLaunchUrl(uri)) {
  //     await launchUrl(uri) ;
  //         return  validateTokenWithLogin(requestToken);
  //   } else {
  //     throw 'Could not launch $uri';
  //   }
  // }
  // Future  validateTokenWithLogin(String requestToken) async {
  //   if (password.text != null && email.text != null ) {
  //     final response = await http.post(
  //       Uri.parse('https://api.themoviedb.org/3/authentication/token/validate_with_login'),
  //       headers: {
  //         'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhOWFjNmE4ZTBjOGZhZmQ4Y2EyZmI0ZDVjYWY0YTE1MiIsIm5iZiI6MTczOTkyMTMzNi42NzM5OTk4LCJzdWIiOiI2N2I1MTdiOGNmYjMzOGVjNWI1ODNjMTgiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.H6yZQ2FYYBEIuIC3pYxDdIwEl3IoNc7C1v3N-CLuUFU',
  //         'Content-Type': 'application/json',
  //       },
  //       body: json.encode({
  //         'username': email.text,
  //         'password': password.text,
  //         'request_token': requestToken,
  //       }),
  //     );
  //     print(response.body) ;
  //       return createSession(requestToken);
  //   } }
  // Future<void> createSession(String requestToken) async {
  //   final response = await http.post(
  //     Uri.parse('https://api.themoviedb.org/3/authentication/session/new'),
  //     headers: {
  //       'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhOWFjNmE4ZTBjOGZhZmQ4Y2EyZmI0ZDVjYWY0YTE1MiIsIm5iZiI6MTczOTkyMTMzNi42NzM5OTk4LCJzdWIiOiI2N2I1MTdiOGNmYjMzOGVjNWI1ODNjMTgiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.H6yZQ2FYYBEIuIC3pYxDdIwEl3IoNc7C1v3N-CLuUFU',
  //       'Content-Type': 'application/json',
  //     },
  //     body: json.encode({
  //       'request_token': requestToken,
  //     }),
  //   );
  //
  //   final data = json.decode(response.body);
  //   print( '=====================================$data') ;
  //   return data['session_id'];
  // }
