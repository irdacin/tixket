import 'package:flutter/material.dart';
import 'package:tixket/data/movie.dart';
import 'package:tixket/pages/booking_movie_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            onPressed: (){}, 
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
                  Row(
                    children: [
                      Text(
                        "More Movies",
                        style: Theme.of(context).textTheme.headlineSmall
                      ),
                      const Icon(Icons.chevron_right)
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 600,
              child: ListView.builder(
                itemCount: movies.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => BookingMoviePage(movie: movies[index]))
                            );
                          },
                          child: Hero(
                            tag: movies[index].title,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                "assets/images/${movies[index].fileName}",
                                fit: BoxFit.cover,
                                height: 500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          movies[index].title,
                          style: Theme.of(context).textTheme.headlineMedium
                        ),
                        Row(
                          children: [
                            for(int i=0; i<5; i++) 
                              Icon(
                                i < movies[index].star.toInt() ? Icons.star : i.toDouble() < movies[index].star ? Icons.star_half : Icons.star_border,
                                color: const Color(0xfff7d300),
                              ),
                            const SizedBox(width: 5),
                            Text(
                              movies[index].star.toStringAsFixed(1),
                              style: const TextStyle(
                                color: Color(0xfff7d300)
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 8),

                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}