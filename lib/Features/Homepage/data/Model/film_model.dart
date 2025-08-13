class Model_Film {
  final int _id ;
  final String _title ;
  final String _original_language ;
  final String _overview ;
  final double _popularity  ;
  final String?  _poster_path ;

  int get id => _id;
  final String _release_date ;
  final double _vote_average ;
  final int _vote_count ;

  Model_Film(this._id, this._title, this._original_language, this._overview,
      this._popularity, this._poster_path, this._release_date,
      this._vote_average, this._vote_count);
  static List <Model_Film> trandingMovies = [] ;
  static   List <Model_Film> discove  = []  ;
  static   List <Model_Film> moviesByCategory  = []  ;
  static   List <Model_Film> searchResults  = []  ;
  factory Model_Film.tranding (List <dynamic> data ) {
     for (var item  in data) {
      trandingMovies.add(Model_Film(item ['id'], item['title'], item['original_language'],item['overview'], item['popularity'], item['poster_path'], item['release_date'], item['vote_average'], item['vote_count'])) ;
  }
    return  Model_Film(data.first ['id'], data.first['title'], data.first['original_language'],data.first['overview'], data.first['popularity'], data.first['poster_path'], data.first['release_date'], data.first['vote_average'], data.first['vote_count']) ;
  } factory Model_Film.discover (List <dynamic> data ) {
     for (var item  in data) {
      discove.add(Model_Film(item ['id'], item['title'], item['original_language'],item['overview'], item['popularity'], item['poster_path'], item['release_date'], item['vote_average'], item['vote_count'])) ;
  }
    return  Model_Film(data.first ['id'], data.first['title'], data.first['original_language'],data.first['overview'], data.first['popularity'], data.first['poster_path'], data.first['release_date'], data.first['vote_average'], data.first['vote_count']) ;
  }
  factory Model_Film.MovieByCategory(List <dynamic> data) {
    moviesByCategory.clear() ;
    for (var item  in data) {
      moviesByCategory.add(Model_Film(item ['id'], item['title'], item['original_language'],item['overview'], item['popularity'], item['poster_path'], item['release_date'], item['vote_average'], item['vote_count'])) ;
    }
    return  Model_Film(data.first ['id'], data.first['title'], data.first['original_language'],data.first['overview'], data.first['popularity'], data.first['poster_path'], data.first['release_date'], data.first['vote_average'], data.first['vote_count']) ; }
 factory Model_Film.SearchResulrt(List <dynamic> data) {
    searchResults.clear() ;
    for (var item  in data) {
      if (item['vote_average']==0){
        continue ;
      }else{
        searchResults.add(Model_Film(item['id'], item['title'], item['original_language'],item['overview'], item['popularity'], item['poster_path'], item['release_date'], item['vote_average'], item['vote_count'])) ;

      }
    }
    return  Model_Film(data.first ['id'], data.first['title'], data.first['original_language'],data.first['overview'], data.first['popularity'], data.first['poster_path'], data.first['release_date'], data.first['vote_average'], data.first['vote_count']) ; }

  String get title => _title;

  String get original_language => _original_language;

  String get overview => _overview;

  double get popularity => _popularity;

  String ? get poster_path => _poster_path;

  String get release_date => _release_date;

  double get vote_average => _vote_average;

  int get vote_count => _vote_count;


}