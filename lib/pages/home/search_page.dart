import 'package:flutter/material.dart';
import 'package:tixket/data/movie_data.dart';
import 'package:tixket/models/movie_model.dart';
import 'package:tixket/pages/movie/movie_detail_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  List<Movie> filteredMovies = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: "searchField",
          child: Material(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.onPrimaryFixed,
              ),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    filteredMovies = value.isEmpty ? [] : movies
                      .where((movie) => 
                      movie.title.toLowerCase().contains(value.toLowerCase()))
                      .toList();
                  });
                },
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                  suffixIcon: searchController.text.isNotEmpty ? 
                    IconButton(
                      onPressed: () => setState(() {
                        searchController.clear();
                        filteredMovies.clear();
                      }), 
                      icon: const Icon(Icons.cancel_outlined)
                    ) : null,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),  
                ),
                autofocus: true,
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: filteredMovies.length,
        itemBuilder: (context, index) {
          Movie movie = filteredMovies[index];
          return ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => MovieDetailPage(movie: movie))
              );
            },
            leading: const Icon(Icons.search),
            title: Text(movie.title),
            trailing: const Icon(Icons.keyboard_arrow_right_sharp),
          );
        },
      ),
    );
  }
}