class Movie {
  String title;
  String fileName;
  String sinopsis;
  double star;
  String producer;
  String director;
  String writer;
  String cast;
  String distributor;
  String type;

  Movie({
    required this.title,
    required this.fileName,
    this.sinopsis = "",
    this.star = 0.0,
    this.producer = "",
    this.director = "",
    this.writer = "",
    this.cast = "",
    this.distributor = "",
    required this.type
  });
}