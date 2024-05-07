import 'package:flutter/material.dart';
import 'package:tixket/components/movie_card.dart';
import 'package:tixket/data/movie.dart';
import 'package:tixket/pages/search_page.dart';
import 'package:tixket/pages/view_all_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Movie> playingNowMovies = movies.where((element) => element.type == "Playing Now").toList();
  final List<Movie> comingSoonMovies = movies.where((element) => element.type == "Coming Soon").toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tixket",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SearchPage())
              );
            }, 
            icon: const Icon(
              Icons.search,
              size: 28,
            )
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Playing Now",
                    style: Theme.of(context).textTheme.headlineMedium
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ViewAllPage(movies: playingNowMovies, typeMovie: "Playing Now"),)
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          "View All",
                          style: Theme.of(context).textTheme.headlineSmall
                        ),
                        const Icon(Icons.chevron_right)
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 400,
              child: ListView.builder(
                itemCount: playingNowMovies.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => MovieCard(movie: playingNowMovies[index]),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Coming Soon",
                    style: Theme.of(context).textTheme.headlineMedium
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ViewAllPage(movies: comingSoonMovies, typeMovie: "Coming Soon"))
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          "View All",
                          style: Theme.of(context).textTheme.headlineSmall
                        ),
                        const Icon(Icons.chevron_right)
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 400,
              child: ListView.builder(
                itemCount: comingSoonMovies.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => MovieCard(movie: comingSoonMovies[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}