
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/Errors/failure.dart';
import '../../../core/Data/Api/Dio_Consumer.dart';
import '../../../core/firebase/firebaseAuth.dart';
import '../domain/entity.dart';
import '../domain/repositry.dart';
import 'Model.dart';
import 'data-source.dart';

class RepositryIm implements  Repiostry {

  @override
  Future <Either<User_Entity,Failure>>SignIN(String email, String password) async {
    try {
   var  user = await UserFirebaseDataSource().signIn(email, password);
    final requestToken =  await Dio_Consumer().getRequestToken();


      print('============================================$requestToken========================') ;
          await  FirebaseFunction().getToken(FirebaseAuth.instance.currentUser!.uid);
      if (user != 'user-not-found' && user != 'wrong-password') {
        return Left(User_Entity(requestToken));
      } else{
        return Right(Failure(errMessage: 'something went wrong')) ;
      }
      // Right('');
    }catch (e) {
        return Right(Failure(errMessage: 'something went wrong'));
    }


  }
  @override
  Future <Either<User_Entity,Failure>>SignUP(String email, String password,String name) async {
    try{
      final response = await UserFirebaseDataSource().signUp(email, password, name);
      print(response) ;
      print('don in IM =======================================================');
      final requestToken =  await Dio_Consumer().getRequestToken();
      final  SessionId =  await Dio_Consumer().postCreateSession(requestToken: requestToken);
      await  FirebaseFunction().addTokenAndSessionId(FirebaseAuth.instance.currentUser!.uid, requestToken, SessionId);
      return Left(User_Entity(requestToken));
    } on Exception catch (e) {
      print(e) ;
      return Right(Failure(errMessage: e.toString()));
    }

  }

}

