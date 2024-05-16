import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tixket/components/read_more_text.dart';
import 'package:tixket/data/movie.dart';
import 'package:tixket/providers/favorite_movie_provider.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailPage({
    super.key, 
    required this.movie
  });

  @override
  Widget build(BuildContext context) {
    bool isFavorite = Provider.of<FavoriteMovieProvider>(context).favoriteMovie.any((element) => element == movie);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(
              Icons.share_outlined,
              size: 25,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Hero(
              tag: movie.title, 
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/2.5,
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    image: AssetImage("assets/images/${movie.fileName}"),
                    fit: BoxFit.cover,
                    opacity: 0.6
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Text(
                          movie.title,
                          style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.white),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.background,
                          borderRadius: const BorderRadius.all(Radius.circular(50)),
                        ),
                        child: IconButton(
                          onPressed: (){
                            if(!isFavorite) {
                              Provider.of<FavoriteMovieProvider>(context, listen: false).addMovie(movie);
                            } else {
                              Provider.of<FavoriteMovieProvider>(context, listen: false).removeMovie(movie);
                            }
                          },
                          icon: Icon( 
                            isFavorite ? Icons.favorite : Icons.favorite_outline,
                            color: isFavorite ? Colors.red : null,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height/2.5,
            left: 0,
            right: 0,
            bottom: 50,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReadMoreText(
                      movie.sinopsis,
                      textAlign: TextAlign.justify,
                      textStyle: Theme.of(context).textTheme.bodySmall,
                      trimLines: 4,
                      textTrimStyle: Theme.of(context).textTheme.displayLarge?.apply(color: Colors.blue),
                      trimCollapsedText: "READ SYNOPSIS",
                      trimExpandedText: "HIDE",
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Producer:",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      movie.producer,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Director:",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      movie.director,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Writer:",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      movie.writer,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Cast:",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      movie.cast,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Distributor:",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      movie.distributor,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 15,
            right: 15,
            bottom: 10,
            child: ElevatedButton(
              onPressed: () {
                if(movie.type == "Playing Now") {
            
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: movie.type == "Playing Now" ? Colors.blue : const Color(0xffc0c0c0),
                textStyle: Theme.of(context).textTheme.headlineMedium,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                )
              ),
              child: const Text("BUY TICKET"),
            ),
          )
        ],
      ),
    );
  }
}