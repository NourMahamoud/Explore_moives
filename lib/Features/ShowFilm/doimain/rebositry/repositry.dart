import 'package:cinemax/Features/ShowFilm/doimain/entity/Film_Entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/Errors/failure.dart';

abstract class  RepositryFilmView {
  Future <Either<Film_Entity_view,Failure>> detilesMovie (int id) ;
}