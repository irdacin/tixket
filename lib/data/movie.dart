class Movie {
  String title;
  String fileName;
  String description;

  Movie({
    required this.title,
    required this.fileName,
    required this.description
  });
}

List<Movie> movies = [
  Movie(
    title: "Avengers: Endgame", 
    fileName: "avengers-endgame.jpg", 
    description: "lorem ipsum"
  ),
  Movie(
    title: "Starwars: The rise of skywalker", 
    fileName: "starwars-the-rise-of-skywalker.jpeg", 
    description: "lorem ipsum"
  ),
  Movie(
    title: "Godzilla: King of The Monsters", 
    fileName: "godzila-king-of-the-monsters.jpeg", 
    description: "lorem ipsum"
  ),
];