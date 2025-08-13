import 'package:cinemax/Features/Homepage/domain/Entity/Entitiy.dart';
import 'package:cinemax/Features/Homepage/domain/repositry/repositry.dart';
import 'package:cinemax/core/Errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dartz/dartz_unsafe.dart';

import '../../../../core/Data/Api/Dio_Consumer.dart';
import '../Model/film_model.dart';
import '../data_Source/remote_data.dart';

class RepositryIm extends Repositry {
  @override
  Future<Either<Film_Entity, Failure>> getDiscoverMovies() async {
      try {
        final data = await Remote_data().getDiscoverMovies() ;
        return Left(Film_Entity.getDiscoverMovies(Model_Film.discove.toList()) );
      } on Exception catch (e) {
        return Right(Failure(errMessage: e.toString())) ;
      }
  }

  @override
  Future<Either<Film_Entity, Failure>> getListFilm(String end_piont) async{
      try {
        print('Done In IM ===========================================') ;
        final data = await Remote_data().getMoviesByCategory(end_piont) ;
        print(Model_Film.moviesByCategory) ;
        return Left(Film_Entity.getMovieByCategory(Model_Film.moviesByCategory));
      } on Exception catch (e) {
        return Right(Failure(errMessage: e.toString())) ;

      }
  }
  @override
  Future<Either<Film_Entity, Failure>> getSearchFilm(String end_piont, Map<String, dynamic> query) async {
      try {
        final data = await Remote_data().getSearchMovies(end_piont, query )  ;
        print('in im') ;
        print(data) ;
        return Left(Film_Entity.searchResults(Model_Film.searchResults)) ;
      } on Exception catch (e)  {
        return Right( Failure(errMessage: e.toString())) ;
      }
  }

  @override
  Future<Either<Film_Entity, Failure>> getTrendingMovies() async{
    try {
      final data = await Remote_data().getTrendingMovies() ;
      return Left(Film_Entity.getTrendingMovies(Model_Film.trandingMovies) );
    } on Exception catch (e) {
      return Right(Failure(errMessage: e.toString())) ;
    }
  }

}