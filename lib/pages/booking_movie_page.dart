import 'package:flutter/material.dart';
import 'package:tixket/data/movie.dart';

class BookingMoviePage extends StatelessWidget {
  final Movie movie;
  const BookingMoviePage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 40, left: 8, right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            }, 
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 25,
                            )
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: (){},
                                icon: const Icon(
                                  Icons.share_outlined,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                              IconButton(
                                onPressed: (){},
                                icon: const Icon(
                                  Icons.favorite_outline,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        movie.title,
                        style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.white),
                      ),
                    )
                  ],
                ),
              )
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Text(movie.description),
                  Icon(Icons.access_alarms)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}