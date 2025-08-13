import '../../../Auth/domain/entity.dart';

class User_Model  {
  final String name ;
  final String token ;
  final String id ;
  final String session_Id ;
  User_Model(this.name, this.token, this.id, this.session_Id)  {
  }

  factory User_Model.from (Map user) {
    return User_Model(
      user['name'],
      user['token'],
      user['id'],
      user['sessionId'],
    ) ;}

}