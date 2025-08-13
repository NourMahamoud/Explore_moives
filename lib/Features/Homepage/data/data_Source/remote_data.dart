import 'package:dartz/dartz.dart';

import '../../../../core/Data/Api/Dio_Consumer.dart';
import '../../../../core/Errors/failure.dart';
import '../Model/film_model.dart';

class  Remote_data {
  final Dio_Consumer dio_consumer = Dio_Consumer() ;
    Future <Either<Model_Film,Failure>> getDiscoverMovies () async {

        try {
          final response = await dio_consumer.GetdiscoverMoives()  ;


            return Left(Model_Film.discover(response)) ;
        } on Exception catch (e) {
          return Right(Failure( errMessage: e.toString())) ;
        }


    }Future <Either<Model_Film,Failure>> getTrendingMovies () async {
        try {
          final response = await dio_consumer.GetTrendingMovies()  ;
            return Left(Model_Film.tranding(response)) ;
        }  catch (e) {


          return Right(Failure( errMessage: e.toString())) ;
        }


    }
    Future <Either<Model_Film,Failure>> getMoviesByCategory (String end_piont) async {
      try {
        final response = await dio_consumer.getMoviesByCategory(end_piont)  ;
        print(response) ;
        return Left(Model_Film.MovieByCategory(response)) ;
      } on Exception catch (e) {
        return Right(Failure( errMessage: e.toString())) ;
      }
    }

    Future <Either<Model_Film,Failure>> getSearchMovies (String end_piont, Map<String,dynamic> query) async {
        try {
          final response = await dio_consumer.get(EndPiont: end_piont, query: query) ;

          return Left(Model_Film.SearchResulrt(response)) ;
        } on Exception catch (e) {
          return  Right(Failure( errMessage: e.toString())) ;
        }

    }


}

