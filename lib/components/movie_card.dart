import 'package:flutter/material.dart';
import 'package:tixket/models/movie_model.dart';
import 'package:tixket/pages/movie/movie_detail_page.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      color: Theme.of(context).cardColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15)
        )
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2 - 25,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => MovieDetailPage(movie: movie))
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: movie.title,
                child: ClipRRect(
                  child: Image.asset(
                    "assets/images/${movie.fileName}",
                    fit: BoxFit.cover,
                    height: 300,
                    width: MediaQuery.of(context).size.width / 2 - 25,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          movie.title,
                          style: Theme.of(context).textTheme.headlineSmall
                        ),
                      ),
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
                      const SizedBox(height: 10)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}