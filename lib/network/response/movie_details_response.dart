// movie_details_response.dart
class MovieDetailsResponse {
  final int page;
  final List<Result> results;
  final int totalPages;
  final int totalResults;

  MovieDetailsResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieDetailsResponse.fromJson(Map<String, dynamic> json) {
    return MovieDetailsResponse(
      page: json['page'],
      results: List<Result>.from(json['results'].map((result) => Result.fromJson(result))),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}

class Result {
  // Define attributes based on actual API response
  final int id;
  final String title;

  Result({
    required this.id,
    required this.title,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      id: json['id'],
      title: json['title'],
    );
  }
}
