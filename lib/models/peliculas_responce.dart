// To parse this JSON data, do
//
//     final popularResponce = popularResponceFromMap(jsonString);

import 'dart:convert';

import 'package:mimo_do/models/movie.dart';

class PopularResponce {
  PopularResponce({
    required this.page,
    required this.results,
  });

  int page;
  List<Movie> results;

  factory PopularResponce.fromJson(String str) =>
      PopularResponce.fromMap(json.decode(str));

  factory PopularResponce.fromMap(Map<String, dynamic> json) => PopularResponce(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
      );
}
