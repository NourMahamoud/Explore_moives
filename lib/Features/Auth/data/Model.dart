class User {
  final  String userName  ;
  final String email ;
  final String  passWord ;
  static String token = '' ;
  final String id ;

  User(this.userName, this.email, this.passWord, this.id);

  factory User.from (Map state) {
   return User(
     state['userName'],
     state['email'],
     state['passWord'],
     state['id'],
   ) ;

  }
}