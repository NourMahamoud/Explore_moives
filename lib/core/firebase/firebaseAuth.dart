import 'package:cinemax/core/Data/Api/Dio_Consumer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Authentication {
  Future <Map<String ,dynamic>?> signUp (String email , String password, String name )async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,

      );
     userCredential.user!.updateDisplayName(name);
     print(userCredential);
      final token =  await Dio_Consumer().getRequestToken() ;
      Map <String ,dynamic> user = {
        'userName' : userCredential.user!.displayName ,
        'email' : userCredential.user!.email ,
        'passWord' : password ,
         'id' : userCredential.user!.uid ,
        'token' : token,
      } ;
      print('donefirebase================================================================================') ;
      return user ;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return {'failure': e.code} ;
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return {'failure': e.code} ;
      }
    } catch (e) {
      print(e);
      return {'failure': e};
    }
    return {'failure': 'something went wrong'} ;

  }

  Future <Map<String ,dynamic>?> signIn (String email , String password)async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password ,
      );
      final token = await FirebaseFunction().getToken(userCredential.user!.uid);
       Map <String, dynamic> user  = {
         'userName' : userCredential.user!.displayName ,
         'email' : userCredential.user!.email ,
         'passWord' : password ,
         'token' : token ,
       } ;
        return user ;
    } on FirebaseAuthException catch (e) {
      print('===============================================') ;
      print(e.toString()) ;
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return {'failure': e.code};
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return {'failure': e.code} ;
      }

    } catch (e) {
      print('==================================================' ) ;
      print(e) ;
      return {'failure': e};
    }

  }
}
class FirebaseFunction {
  CollectionReference token = FirebaseFirestore.instance.collection('token');
  Future addTokenAndSessionId (String userId , String token, String sessionId)async{
   return await this.token.add({
     'id' : userId ,
     'token' : token ,
     'sessionId' : sessionId ,
   }).then((value) => print("User Added")).catchError((error) => print("Failed to add user: $error"));
  }
  Future<Map<String, dynamic>?> getToken(String userId) async {
    try {
      final querySnapshot = await token.where('id', isEqualTo: userId).get();
      if (querySnapshot.docs.isNotEmpty) {
        final tokenDoc = querySnapshot.docs.first;
        Map <String, dynamic> token_SessionId = {
          'token' :  tokenDoc['token'],
          'sessionId' : tokenDoc['sessionId'],
        } ;
        return token_SessionId  ;
      } else {

  }
    } catch (e) {
      print('Error getting token: $e');

    }
    }
}

