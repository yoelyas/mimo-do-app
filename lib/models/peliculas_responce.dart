// To parse this JSON data, do
//
//     final popularResponce = popularResponceFromMap(jsonString);

import 'dart:convert';

import 'package:mimo_do/models/movie.dart';

class PopularResponce {
  PopularResponce({
    required this.page,
    required this.results,
    //required this.totalPages,
    //required this.totalResults,
  });

  int page;
  List<Movie> results;
  //int totalPages;
  //int totalResults;

  factory PopularResponce.fromJson(String str) =>
      PopularResponce.fromMap(json.decode(str));

  factory PopularResponce.fromMap(Map<String, dynamic> json) => PopularResponce(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        //totalPages: json["total_pages"],
        //totalResults: json["total_results"],
      );
}
