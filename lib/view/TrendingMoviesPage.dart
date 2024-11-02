import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../network/api_service.dart';
import 'MovieDetailsPage.dart';

class TrendingMoviesPage extends StatelessWidget {
  final ApiService apiService = ApiService(http.Client());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trending Movies'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: apiService.getMoviesTrending(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.data == null || !snapshot.data!.containsKey('results')) {
            return Center(child: Text('No movies found'));
          } else {
            final movies = snapshot.data!['results'];
            return GridView.builder(
              padding: EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                childAspectRatio: 0.7, // Adjust the aspect ratio for the grid items
                crossAxisSpacing: 8, // Space between columns
                mainAxisSpacing: 8, // Space between rows
              ),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                final posterPath = movie['poster_path'];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetailsPage(movieId: movie['id']),
                      ),
                    );
                  },
                  child: posterPath != null
                      ? Image.network(
                    'https://image.tmdb.org/t/p/w500$posterPath',
                    fit: BoxFit.cover, // Ensures the image covers the available space
                  )
                      : Icon(Icons.broken_image, size: 100), // Fallback icon if no image
                );
              },
            );
          }
        },
      ),
    );
  }
}
