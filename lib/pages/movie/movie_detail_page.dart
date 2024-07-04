import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tixket/components/read_more_text.dart';
import 'package:tixket/models/movie_model.dart';
import 'package:tixket/pages/movie/buy_movie_page.dart';
import 'package:tixket/providers/favorite_movie_provider.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;
  final bool showBuyButton;

  const MovieDetailPage({
    super.key, 
    required this.movie,
    this.showBuyButton = true
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
            onPressed: () {
              showModalBottomSheet(
                context: context, 
                builder: (context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              }, 
                              icon: const Icon(Icons.close)
                            ),
                            Text(
                              "Share this movie",
                              style: Theme.of(context).textTheme.headlineMedium,
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          movie.title,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: 100,
                          height: 120,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/${movie.fileName}"),
                              fit: BoxFit.cover
                            ),
                            borderRadius: BorderRadius.circular(20)
                          ),
                        ),
                        const SizedBox(height: 10),
                        Divider(thickness: 0.0, color: Theme.of(context).colorScheme.secondary),
                        const SizedBox(height: 10),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.blue
                                      )
                                    ),
                                    child: const Icon(
                                      Icons.link_outlined,
                                      color: Colors.blue,
                                      size: 25,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "Copy Link",
                                    style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 12),
                                  )
                                ],
                              ),
                              const SizedBox(width: 20),
                              Column(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.blue
                                      )
                                    ),
                                    child: const Icon(
                                      FontAwesomeIcons.whatsapp,
                                      color: Colors.blue,
                                      size: 25,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "WhatsApp",
                                    style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 12),
                                  )
                                ],
                              ),
                              const SizedBox(width: 20),
                              Column(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.blue
                                      )
                                    ),
                                    child: const Icon(
                                      FontAwesomeIcons.telegram,
                                      color: Colors.blue,
                                      size: 25,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "Telegram",
                                    style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 12),
                                  )
                                ],
                              ),
                              const SizedBox(width: 20),
                              Column(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.blue
                                      )
                                    ),
                                    child: const Icon(
                                      FontAwesomeIcons.instagram,
                                      color: Colors.blue,
                                      size: 25,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "Instagram",
                                    style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 12),
                                  )
                                ],
                              ),
                              const SizedBox(width: 20),
                              Column(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.blue
                                      )
                                    ),
                                    child: const Icon(
                                      FontAwesomeIcons.commentSms,
                                      color: Colors.blue,
                                      size: 25,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "SMS",
                                    style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 12),
                                  )
                                ],
                              ),
                              const SizedBox(width: 20),
                              Column(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.blue
                                      )
                                    ),
                                    child: const Icon(
                                      Icons.email_outlined,
                                      color: Colors.blue,
                                      size: 25,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "Email",
                                    style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 12),
                                  )
                                ],
                              ),
                              const SizedBox(width: 20),
                              Column(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.blue
                                      )
                                    ),
                                    child: const Icon(
                                      Icons.more_vert,
                                      color: Colors.blue,
                                      size: 25,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "Other",
                                    style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 12),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            },
            tooltip: "Share",
            icon: const Icon(
              Icons.share_outlined,
              size: 25,
            ),
          ),
          const SizedBox(width: 10)
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
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
              child: Hero(
                tag: movie.title,
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
                          color: Theme.of(context).cardColor,
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
                          tooltip: !isFavorite ? "Add to favorite" : "Remove to favorite",
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
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height/2.5,
            left: 0,
            right: 0,
            bottom: showBuyButton ? 50 : 0,
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
                    Visibility(
                      visible: showBuyButton,
                      child: const SizedBox(height: 20)
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Visibility(
              visible: showBuyButton,
              child: Container(
                padding: const EdgeInsets.all(15),
                color: Theme.of(context).scaffoldBackgroundColor,
                child: ElevatedButton(
                  onPressed: () {
                    if(movie.type == "Coming Soon") return;
                
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => BuyMoviePage(movie: movie),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          const begin = Offset(0.0, 1.0);
                          const end = Offset.zero;
                          const curve = Curves.ease;
                
                          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                
                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                      )
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: movie.type == "Playing Now" ? Colors.blue : Theme.of(context).colorScheme.secondary,
                    textStyle: Theme.of(context).textTheme.headlineMedium,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    )
                  ),
                  child: const Text("BUY TICKET"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}