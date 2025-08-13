import 'package:cinemax/Features/Auth/domain/entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/Errors/failure.dart';
import '../data/Model.dart';

abstract class Repiostry {
Future <Either<User_Entity,Failure>>  SignIN (String  email , String password) ;
Future <Either<User_Entity,Failure>>  SignUP (String  email , String password,String name) ;
}