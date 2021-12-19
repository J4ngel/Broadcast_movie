class Movie_model{
  String? poster_path;
  String? original_title;
  String? release_date;
  String? overview;
  
  Movie_model({
    required this.poster_path,
    required this.original_title,
    required this.release_date,
    required this.overview,
  });

  factory Movie_model.fromJson(Map <String, dynamic> map){
    return Movie_model(
    poster_path: map["poster_path"], 
    original_title: map["original_title"], 
    release_date: map["release_date"], 
    overview: map["overview"]
    );
  }

  Map <String, dynamic> toJson (){
    return {
    "poster_path":poster_path,
    "original_title":original_title,
    "release_date":release_date,
    "overview":overview};
  }

  getPosterImg() {
    if (poster_path == null) {
      return 'https://img2.freepng.es/20180216/kee/kisspng-photographic-film-reel-clip-art-movie-film-5a8677562304e0.0541516415187618141435.jpg';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$poster_path';
    }
  }
}