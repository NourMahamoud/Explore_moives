import 'package:cinemax/Features/ShowFilm/doimain/rebositry/repositry.dart';
import 'package:cinemax/core/Errors/failure.dart';
import 'package:dartz/dartz.dart';

import '../../doimain/entity/Film_Entity.dart';
import '../data_source/remote_source.dart';

class ReposistryIm extends RepositryFilmView {
  @override
  Future<Either<Film_Entity_view,Failure>>detilesMovie(int id) async{
    try {
      final  response =  await Remote_DataSource().detilesMovie(id) ;
      var film ;
      await response.fold((film_model)=> film = film_model, (failure) =>Right(failure)) ;
         if (film != null) {
           print('====================================================================================================================') ;
           print(film.title) ;
           return Left( Film_Entity_view.fromJson(film)) ;

         }else {
          print('Condetion not done ===============================================================================') ;
           return Right(Failure(errMessage: 'gg'));
         }

    } on Exception catch (e) {
      return Right(Failure(errMessage: e.toString())) ;
    }

  }

}