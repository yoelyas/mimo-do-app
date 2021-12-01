import 'dart:convert';

class Movie {
  Movie({
    this.posterPath,
    required this.title,
  });

  String? posterPath;
  String title;

  get fullPosterImg {
    if (posterPath != null) {
      return 'https://image.tmdb.org/t/p/w500$posterPath';
    } else {
      return 'https://plantillasdememes.com/img/plantillas/imagen-no-disponible01601774755.jpg';
    }
  }

  factory Movie.fromJson(String str) => Movie.fromMap(json.decode(str));

  factory Movie.fromMap(Map<String, dynamic> json) => Movie(
        posterPath: json["poster_path"],
        title: json["title"],
      );

  Map<String, dynamic> toMap() => {
        "poster_path": posterPath,
        "title": title,
      };
}
