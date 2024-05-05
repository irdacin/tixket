import 'package:flutter/material.dart';
import 'package:tixket/data/movie.dart';
import 'package:tixket/pages/movie_detail_page.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width/2 - 10,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20)
        ),
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => MovieDetailPage(movie: movie))
              );
            },
            child: Hero(
              tag: movie.title,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20)
                ),
                child: Image.asset(
                  "assets/images/${movie.fileName}",
                  fit: BoxFit.cover,
      width: MediaQuery.of(context).size.width/2 - 10,

                  height: 300,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            height: 48,
            child: Text(
              movie.title,
              maxLines: null,
              overflow: TextOverflow.visible,
              style: Theme.of(context).textTheme.headlineSmall
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
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
          ),
        ],
      ),
    );
  }
}