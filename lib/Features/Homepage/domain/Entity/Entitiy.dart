import 'package:cinemax/Features/Homepage/data/Model/film_model.dart';


class Film_Entity {
  final int id ;
  final String title ;
  final  String ? poster_path ;
  final String release_date ;
  final double vote_average ;

  Film_Entity(this.id, this.title, this.poster_path, this.release_date,
      this.vote_average);


   static  List <Film_Entity> movies_entity_discover  = [];
   static  List <Film_Entity> movies_entity_trending  = [];
   static List <Film_Entity> movies_entity_by_category  = [];
   static List <Film_Entity> search_results  = [];
  factory Film_Entity.getTrendingMovies(List<Model_Film> data) {
    for (var item in data) {
      movies_entity_trending.add(Film_Entity(
        item.id,
        item.title,
        item.poster_path,
        item.release_date,
        item.vote_average,
      ));
    }

    var first = data[0];
    return Film_Entity(
      first.id,
      first.title,
      first.poster_path,
      first.release_date,
      first.vote_average,
    );
  }
  factory Film_Entity.getDiscoverMovies(List<Model_Film> data) {
    for (var item in data) {
      movies_entity_discover.add(Film_Entity(
        item.id,
        item.title,
        item.poster_path,
        item.release_date,
        item.vote_average,
      ));
    }


    var first = data.first;
    return Film_Entity(
      first.id,
      first.title,
      first.poster_path,
      first.release_date,
      first.vote_average,
    );
  }

  factory Film_Entity.getMovieByCategory(List<Model_Film> data) {
    movies_entity_by_category = [];
    for (var item in data) {
      movies_entity_by_category.add(Film_Entity(
        item.id,
        item.title,
        item.poster_path,
        item.release_date,
        item.vote_average,
      ));
    }
    var first = data.first;
    return Film_Entity(
      first.id,
      first.title,
      first.poster_path,
      first.release_date,
      first.vote_average,
    );
  }factory Film_Entity.searchResults(List<Model_Film> data) {
    for (var item in data) {
      search_results.add(Film_Entity(
        item.id,
        item.title,
        item.poster_path,
        item.release_date,
        item.vote_average,
      ));
    }
    print('in entity $search_results') ;
    print(search_results.first.poster_path) ;
     if (data.isNotEmpty){
       var first = data.first;
       return Film_Entity(
         first.id,
         first.title,
         first.poster_path,
         first.release_date,
         first.vote_average,
       );
     }else {
       return Film_Entity(0, '', '', '', 0);

     }

  }


}