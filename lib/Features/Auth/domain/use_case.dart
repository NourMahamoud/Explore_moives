import 'package:cinemax/Features/Auth/domain/entity.dart';
import 'package:cinemax/Features/Auth/domain/repositry.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/Errors/failure.dart';
import '../data/Model.dart';
import '../data/repositryIM.dart';

class Use_case{
 final Repiostry  repiostry;


 Use_case(this.repiostry);

 Future <Either<User_Entity, Failure>> SignIn(String email , String password)async{
   return  repiostry.SignIN(email, password) ; }
  Future <Either<User_Entity, Failure>> SignUp(String email , String password,String name)async{
    return  repiostry.SignUP(email, password,name) ; }

}