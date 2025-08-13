import 'package:cinemax/Features/ShowFilm/data/model/film_model.dart';

class Film_Entity_view {
  final int id;

  final String background;

  final String poster;

  final String overView;

  final List type;

  final String title;

  final String relase_data;

  final double avarageRate;

  final int deuration;

  Film_Entity_view(
      {required this.id, required this.background, required this.poster, required this.overView, required this.type,
        required this.title, required this.relase_data, required this.avarageRate, required this.deuration});

  factory Film_Entity_view.fromJson( Film_Model json) {
    print('in factoryyyyyyyyyyyyyyyyyy') ;
    return Film_Entity_view(
      id:   json.id,
        title: json.title,
       overView:  json.overview,
       poster: json.poster_path!,
        relase_data: json.release_date,
       avarageRate: json.vote_average,
     background:  json.backdrop_path!,
     deuration: json.douration,
      type: json.type,
    ) ;
  }
}