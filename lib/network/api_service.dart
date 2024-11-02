// api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'network_constants.dart';

class ApiService {
  final http.Client client;

  ApiService(this.client);

  Future<Map<String, dynamic>> getMoviesTrending({String language = "en-US", int page = 1}) async {
    final url = Uri.parse('${NetworkConstants.baseUrl}${NetworkConstants.moviesTrending}?language=$language&page=$page');
    final response = await client.get(
      url,
      headers: {
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ZDg0YWQ4ODc1YTMzMTQzYmU0ZDM4YzUxZWViYmY4MiIsIm5iZiI6MTcyMjk2MjYxNi41NjAyNTQsInN1YiI6IjY2OWJlMTgwYTQ4ZGY3OWYwMjc3NzQ2ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.FAmjOvHm4jj4DzaEHQ5cynUGsKh2wVszxA4mYQq9GUw",
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load trending movies");
    }
  }

  Future<Map<String, dynamic>> getMovieDetails(int movieId, {String language = "en-US"}) async {
    final url = Uri.parse('${NetworkConstants.baseUrl}${NetworkConstants.moviesDetails.replaceFirst("{movie_id}", movieId.toString())}?language=$language');
    final response = await client.get(
      url,
      headers: {
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ZDg0YWQ4ODc1YTMzMTQzYmU0ZDM4YzUxZWViYmY4MiIsIm5iZiI6MTcyMjk2MjYxNi41NjAyNTQsInN1YiI6IjY2OWJlMTgwYTQ4ZGY3OWYwMjc3NzQ2ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.FAmjOvHm4jj4DzaEHQ5cynUGsKh2wVszxA4mYQq9GUw",
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load movie details");
    }
  }
}
