class Movie {
  String title;
  String fileName;
  String description;
  double star;

  Movie({
    required this.title,
    required this.fileName,
    required this.description,
    this.star = 0.0
  });
}

List<Movie> movies = [
  Movie(
    title: "Avengers: Endgame", 
    fileName: "avengers-endgame.jpg", 
    description: "lorem ipsum",
    star: 3.0
  ),
  Movie(
    title: "Starwars: The rise of skywalker", 
    fileName: "starwars-the-rise-of-skywalker.jpeg", 
    description: "lorem ipsum",
    star: 3.5
  ),
  Movie(
    title: "Godzilla: King of The Monsters", 
    fileName: "godzila-king-of-the-monsters.jpeg", 
    description: "lorem ipsum"
  ),
];