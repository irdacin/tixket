import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tixket/models/movie_model.dart';
import 'package:tixket/pages/home/movie_detail_page.dart';
import 'package:tixket/pages/index_page.dart';
import 'package:tixket/providers/favorite_movie_provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Movie> favoriteMovie = Provider.of<FavoriteMovieProvider>(context).favoriteMovie;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10),
        child: favoriteMovie.isEmpty ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Your favorite movies is empty",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Text(
              "Start add your favorite movies now!",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const IndexPage()),
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: Theme.of(context).textTheme.displayLarge
              ),  
              child: const Text("Find Movies")
            )
          ],
        ) : SingleChildScrollView(
          child: Column(
            children: favoriteMovie.map((movie) {
              return Card(
                elevation: 5,
                color: Theme.of(context).cardColor,
                margin: const EdgeInsets.all(10),
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MovieDetailPage(movie: movie))
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 150,
                          width: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/${movie.fileName}"),
                              fit: BoxFit.cover
                            ),
                            borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 150,
                            padding: const EdgeInsets.only(top: 10, left: 10),
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      movie.title,
                                      style: Theme.of(context).textTheme.headlineMedium,
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        for(int i=0; i<5; i++) 
                                          Icon(
                                            i < movie.star.toInt() ? Icons.star : i.toDouble() < movie.star ? Icons.star_half : Icons.star_border,
                                            color: const Color(0xfff7d300),
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            movie.star.toStringAsFixed(1),
                                            style: const TextStyle(
                                              color: Color(0xfff7d300)
                                            ),
                                          )
                                      ],
                                    ),
                                  ],
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: IconButton(
                                    onPressed: (){
                                      Provider.of<FavoriteMovieProvider>(context, listen: false).removeMovie(movie);
                                    },
                                    tooltip: "Remove to favorite",
                                    icon: const Icon( 
                                      Icons.delete,
                                      color: Colors.red,
                                      size: 30,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        )
      ),
    );
  }
}