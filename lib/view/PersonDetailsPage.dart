import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../network/api_person_service.dart';
import '../network/response/PersonResponse.dart';

class PersonDetailsPage extends StatelessWidget {
  final ApiPersonService apiPersonService = ApiPersonService(http.Client());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trending People'),
      ),
      body: FutureBuilder<PersonResponse>(
        future: apiPersonService.getPersonTrending(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('An error occurred. Please try again later.'),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Optionally add retry logic here
                    },
                    child: Text('Retry'),
                  ),
                ],
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.results.isEmpty) {
            return Center(child: Text('No people found.'));
          } else {
            final people = snapshot.data!.results;
            return ListView.builder(
              itemCount: people.length,
              itemBuilder: (context, index) {
                final person = people[index];
                return PersonTile(person: person);
              },
            );
          }
        },
      ),
    );
  }
}

class PersonTile extends StatelessWidget {
  final Person person;

  PersonTile({required this.person});

  String getProfileImageUrl(String? path) {
    return path != null && path.isNotEmpty
        ? 'https://image.tmdb.org/t/p/w500$path'
        : '';
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: getProfileImageUrl(person.profilePath).isNotEmpty
          ? Image.network(getProfileImageUrl(person.profilePath))
          : Icon(Icons.person, size: 40),
      title: Text(person.name ?? 'Unknown'),
      subtitle: Text(person.department ?? 'No department'),
    );
  }
}
