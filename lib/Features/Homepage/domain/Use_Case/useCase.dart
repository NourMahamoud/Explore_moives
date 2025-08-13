import 'package:cinemax/Features/Homepage/data/repositry_Im/repositryIm.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/Errors/failure.dart';
import '../Entity/Entitiy.dart';
import '../repositry/repositry.dart';

class FilmUseCase {
  final Repositry repositry = RepositryIm() ;
  Future<Either<Film_Entity?, Failure>> getDiscoverMovies () async {
    return await repositry.getDiscoverMovies() ;
  }Future<Either<Film_Entity?, Failure>> getTrendingMovies () async {
    return await repositry.getTrendingMovies() ;
  }
  Future <Either<Film_Entity,Failure>> getListFilm (String end_piont) async {
    return await repositry.getListFilm(end_piont) ;
  }
  Future <Either<Film_Entity,Failure>> getSearchFilm (String end_piont , Map<String,dynamic> query) async {
    return await repositry.getSearchFilm(end_piont, query) ;
  }



}