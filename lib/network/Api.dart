import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  static const String _baseUrl = 'https://api.themoviedb.org/3';
  static const String _apiKey = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ZDg0YWQ4ODc1YTMzMTQzYmU0ZDM4YzUxZWViYmY4MiIsIm5iZiI6MTcyMjk2MjYxNi41NjAyNTQsInN1YiI6IjY2OWJlMTgwYTQ4ZGY3OWYwMjc3NzQ2ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.FAmjOvHm4jj4DzaEHQ5cynUGsKh2wVszxA4mYQq9GUw';

  Future<Map<String, dynamic>> getMoviesTrending({String language = 'en-US', int page = 1}) async {
    final url = Uri.parse('$_baseUrl/trending/movie/day?language=$language&page=$page');
    final response = await http.get(
      url,
      headers: {'Authorization': _apiKey},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load trending movies');
    }
  }

  Future<Map<String, dynamic>> getMovieDetails(int movieId, {String language = 'en-US'}) async {
    final url = Uri.parse('$_baseUrl/movie/$movieId?language=$language');
    final response = await http.get(
      url,
      headers: {'Authorization': _apiKey},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load movie details');
    }
  }
}
