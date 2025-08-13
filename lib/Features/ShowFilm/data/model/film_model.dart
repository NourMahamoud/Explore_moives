class Film_Model {
  final int id ;
  final String title ;
  final String overview ;
  final double popularity  ;
  final String?  poster_path ;
  final String release_date ;

  final double vote_average ;
  final int vote_count ;
  final String ? backdrop_path ;
  final int douration ;
  final List type ;


  Film_Model(this.id, this.title, this.overview, this.popularity,
      this.poster_path, this.release_date, this.vote_average, this.vote_count,
      this.backdrop_path, this.douration, this.type);

  factory Film_Model.fromJson(Map<String, dynamic> json) {
    return Film_Model(
        json['id'],  json['title'],  json['overview'], json['popularity'], json['poster_path'], json['release_date'], json['vote_average'],json ['vote_count'],json ['backdrop_path'], json['runtime'], json['genres']) ;
  }


}