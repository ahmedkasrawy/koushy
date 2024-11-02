import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../network/api_service.dart';

class MovieDetailsPage extends StatelessWidget {
  final ApiService apiService = ApiService(http.Client());
  final int movieId; // The ID of the movie passed from the previous page

  MovieDetailsPage({required this.movieId}); // Required parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Details'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: apiService.getMovieDetails(movieId), // Use the passed movieId
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.data == null) {
            return Center(child: Text('No details found'));
          } else {
            final movie = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(movie['title'], style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text('Release Date: ${movie['release_date']}'),
                  SizedBox(height: 10),
                  Text('Overview: ${movie['overview']}'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
