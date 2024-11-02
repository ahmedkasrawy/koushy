// api_person_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:section_project_7th/network/response/PersonResponse.dart';

class ApiPersonService {
  final http.Client client;

  ApiPersonService(this.client);

  Future<PersonResponse> getPersonTrending({String language = "en-US", int page = 1}) async {
    final url = Uri.parse('https://api.themoviedb.org/3/trending/person/day?language=$language&page=$page');
    final response = await client.get(
      url,
      headers: {
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ZDg0YWQ4ODc1YTMzMTQzYmU0ZDM4YzUxZWViYmY4MiIsIm5iZiI6MTcyMjk2MjYxNi41NjAyNTQsInN1YiI6IjY2OWJlMTgwYTQ4ZGY3OWYwMjc3NzQ2ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.FAmjOvHm4jj4DzaEHQ5cynUGsKh2wVszxA4mYQq9GUw",
      },
    );

    if (response.statusCode == 200) {
      return PersonResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load person details");
    }
  }
}
