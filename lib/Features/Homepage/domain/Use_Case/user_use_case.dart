import 'package:cinemax/Features/Homepage/data/repositry_Im/User_repositryIm.dart';

import '../repositry/User_repositry.dart';

class  User_UseCase {
  final User_repositry user_repositry = User_RepositryIm();
Future <String> getUserName ()async{
  try {

    return  await user_repositry.getUserName() ;
  }catch(e){return e.toString() ;}
}
}