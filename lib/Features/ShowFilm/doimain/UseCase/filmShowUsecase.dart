import 'package:dartz/dartz.dart';

import '../../../../core/Errors/failure.dart';
import '../../data/RebositryIm/repositryIM.dart';
import '../entity/Film_Entity.dart';

class FilmShow_Usecase {
  Future  <Either<Film_Entity_view,Failure>> detilesMovie (int id) {
    return ReposistryIm().detilesMovie(id) ;
  }
}