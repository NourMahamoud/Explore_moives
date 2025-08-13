abstract class Api_Consumer {
  Future <String> getRequestToken() ;
  Future <String> postCreateSession ({required String requestToken}) ;
  Future  GetTrendingMovies() ;
  Future  GetdiscoverMoives() ;
  Future <Map<String ,dynamic>> GetMovieDetailes({required int movieId}) ;
  Future  get({required String EndPiont, required Map<String, dynamic> query}) ;
  Future <Map<String ,dynamic>> post({required String EndPiont}) ;
  Future  getMoviesByCategory (String end_piont) ;


}