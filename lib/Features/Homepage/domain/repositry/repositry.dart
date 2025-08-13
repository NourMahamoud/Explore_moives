import 'package:cinemax/Features/Homepage/domain/Entity/Entitiy.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/Errors/failure.dart';

abstract class Repositry {
   Future <Either<Film_Entity,Failure>> getDiscoverMovies () ;
   Future <Either<Film_Entity,Failure>> getTrendingMovies () ;
   Future <Either<Film_Entity,Failure>> getListFilm (String end_piont) ;
   Future <Either<Film_Entity,Failure>> getSearchFilm (String end_piont , Map<String,dynamic> query) ;
}