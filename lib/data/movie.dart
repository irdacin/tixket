class Movie {
  String title;
  String fileName;
  String description;
  double star;
  String producer;

  Movie({
    required this.title,
    required this.fileName,
    this.description = "",
    this.star = 0.0,
    this.producer = ""
  });
}

List<Movie> movies = [
  Movie(
    title: "Avengers: Endgame", 
    fileName: "avengers-endgame.jpg", 
    description: "halo 1",
    star: 3.0
  ),
  Movie(
    title: "Starwars: The rise of skywalker", 
    fileName: "starwars-the-rise-of-skywalker.jpeg", 
    description: "lorem 2",
    star: 3.5
  ),
  Movie(
    title: "Godzilla: King of The Monsters", 
    fileName: "godzila-king-of-the-monsters.jpeg", 
    description: "lorem 3"
  ),
];