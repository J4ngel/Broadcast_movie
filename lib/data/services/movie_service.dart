import 'package:broadcast_movie/data/models/movie_model.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Movie_service{
  List<Movie_model> movies = []; 
  final tmdb = TMDB(ApiKeys('075fe4d221cdde117b1a8605cd206cd5', 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwNzVmZTRkMjIxY2RkZTExN2IxYTg2MDVjZDIwNmNkNSIsInN1YiI6IjYxYjQ5NzhiOWQ4OTM5MDA4ZjZlZDRkZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.waZeOJOU-130IpUEff79KkStBuSiYd2oNP-X4z_kQ44'),
  logConfig: ConfigLogger(showErrorLogs: true, showLogs: true));

  Future<List<Movie_model>> load_trending_movie() async {
    List temp = [];
    Map result_trending = await tmdb.v3.trending.getTrending();
    temp = result_trending['results'];
    for (var item in temp) {
      movies.add(Movie_model.fromJson(item));
    }
    print(movies[0].poster_path);
    return movies;
  }
}