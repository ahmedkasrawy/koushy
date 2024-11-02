import 'package:flutter/material.dart';
import 'MovieDetailsPage.dart';
import 'PersonDetailsPage.dart';
import 'TrendingMoviesPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose an Option'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TrendingMoviesPage()),
              );
            },
            child: Text('Trending Movies'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PersonDetailsPage()),
              );
            },
            child: Text('Person Details'),
          ),
        ],
      ),
    );
  }
}