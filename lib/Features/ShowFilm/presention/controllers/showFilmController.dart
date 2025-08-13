import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../doimain/UseCase/filmShowUsecase.dart';
import '../../doimain/entity/Film_Entity.dart';

class ShowFilm_Controller extends GetxController {

  var  data ;
  double rate = 0 ;
  bool isFavorite = false;
  Future detilesMovie(int id) async {
    final response = await FilmShow_Usecase().detilesMovie(id);
    response.fold((film) {
      data = film;
      update();
    }, (failure) =>
        print(failure.errMessage));
  }
  void  addToFavorite(int id) {
     isFavorite =true ;
     update() ;
  }
  void addRate(double val){
    rate =val ;
    update() ;

  }
  void postRate(int id){

  }

}

