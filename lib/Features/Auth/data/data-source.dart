import 'package:cinemax/Features/Auth/domain/entity.dart';
import 'package:cinemax/core/firebase/firebaseAuth.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/Errors/failure.dart';
import 'Model.dart';

class UserFirebaseDataSource {
final Authentication  auth   = Authentication();
 Future <Either<User,Failure>>signIn (String email , String password )async{
   var user = await auth.signIn(email, password);
   if (user!['failure'] != 'user-not-found' && user['failure'] != 'wrong-password') {
     print('ggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg==================================================') ;
     User.token= 'token==============================================================================' ;
     print(User.token) ;
     return Left(User.from(user));
   }else if (user == 'user-not-found'){
     return Right(Failure(errMessage:  'user-not-found')) ;
   } else if (user == 'wrong-password') {
     return Right(Failure(errMessage:  'wrong-password')) ;
   }  else{
     return Right(Failure(errMessage: 'something went wrong')) ;
   }
   }
   Future <Either<User,Failure>>signUp (String email , String password,name )async{
   final user = await auth.signUp(email, password,name) ;
      if (user!['failure']== 'weak-password' && user['failure'] != 'email-already-in-use') {
     return Left(User.from(user));
   }else if (user['failure'] == 'weak-password'){
        return Right(Failure(errMessage: 'weak-password')) ;
      } else if (user['failure'] == 'email-already-in-use') {
        return Right(Failure(errMessage: 'email-already-in-use')) ;
      }  else{
        return Right(Failure(errMessage: 'something went wrong')) ;
      }
   }
}



