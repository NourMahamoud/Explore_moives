import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repositry/User_repositry.dart';

class User_RepositryIm extends  User_repositry {
  @override
  Future<String> getUserName() async {
    try {
     return await FirebaseAuth.instance.currentUser!.displayName! ;
    } catch (e) {
      return e.toString() ;
    }
  }

}