// person_response.dart
class PersonResponse {
  final int page;
  final List<Person> results;

  PersonResponse({required this.page, required this.results});

  factory PersonResponse.fromJson(Map<String, dynamic> json) {
    return PersonResponse(
      page: json['page'] ?? 0,
      results: (json['results'] as List).map((e) => Person.fromJson(e)).toList(),
    );
  }
}

class Person {
  final String name;
  final String profilePath;
  final String department;
  final double averageVote;
  final bool isAdult;

  Person({
    required this.name,
    required this.profilePath,
    required this.department,
    required this.averageVote,
    required this.isAdult,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: json['original_name'] ?? 'Unknown',
      profilePath: json['profile_path'] ?? '',
      department: json['known_for_department'] ?? 'Unknown',
      averageVote: (json['vote_average'] ?? 0).toDouble(),
      isAdult: json['adult'] ?? false,
    );
  }
}
