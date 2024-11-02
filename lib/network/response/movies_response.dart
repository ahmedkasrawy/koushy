// movies_response.dart
class MoviesResponse {
  final List<Movie> movies;

  MoviesResponse({required this.movies});

  factory MoviesResponse.fromJson(Map<String, dynamic> json) {
    return MoviesResponse(
      movies: List<Movie>.from(json['results'].map((movie) => Movie.fromJson(movie))),
    );
  }
}

class Movie {
  final int id;
  final String title;
  final String? posterPath;

  Movie({required this.id, required this.title, this.posterPath});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'],
    );
  }
}
