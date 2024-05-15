import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tixket/data/movie.dart';

class MovieDetailPage extends StatefulWidget {
  final Movie movie;

  const MovieDetailPage({
    super.key, 
    required this.movie
  });

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  bool isReadSynopsis = false;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
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
          IconButton(
            onPressed: (){
              setState(() {
                isFavorite ^= true;
              });
            },
            icon: Icon( 
              isFavorite ? Icons.favorite : Icons.favorite_outline,
              color: isFavorite ? Colors.red : null,
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
              tag: widget.movie.title, 
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/2.5,
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    image: AssetImage("assets/images/${widget.movie.fileName}"),
                    fit: BoxFit.cover,
                    opacity: 0.6
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    widget.movie.title,
                    style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.white),
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
                    Text(
                      widget.movie.sinopsis,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: isReadSynopsis ? null : 4,
                      overflow: isReadSynopsis ? null : TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isReadSynopsis ^= true;
                        });
                      },
                      child: Text(
                        isReadSynopsis ? "HIDE" : "READ SYNOPSIS",
                        style: Theme.of(context).textTheme.bodyLarge?.apply(color: Colors.blue)
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Producer:",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      widget.movie.producer,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Director:",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      widget.movie.director,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Writer:",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      widget.movie.writer,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Cast:",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      widget.movie.cast,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Distributor:",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      widget.movie.distributor,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(height: 20),
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
                if(widget.movie.type == "Playing Now") {
            
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: widget.movie.type == "Playing Now" ? Colors.blue : Color(0xffc0c0c0),
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