import 'package:cinemax/core/Data/Api/Dio_Consumer.dart';
import 'package:cinemax/core/Errors/failure.dart';
import 'package:dartz/dartz.dart';

import '../model/film_model.dart';

class Remote_DataSource{
  Dio_Consumer dio_consumer = Dio_Consumer();
  Future <Either<Film_Model,Failure>> detilesMovie (int id)async{
    try {
      final response = await dio_consumer.GetMovieDetailes(movieId: id) ;
      print(response) ;
      return Left(Film_Model.fromJson(response)) ;
    } on Exception catch (e) {
      return Right(Failure( errMessage: e.toString())) ;

    }
  }
}