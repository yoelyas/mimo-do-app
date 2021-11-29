import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mimo_do/models/movie.dart';
import 'package:mimo_do/models/peliculas_responce.dart';
import 'package:mimo_do/const/env.dart';

class MoviesProvider extends ChangeNotifier {
  Random _random = Random();
  String _apikey = apiKey;
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';
  List<Movie> _movies = [];
  Movie _movie = Movie(title: '');

  reset() {
    _random = Random();
    _apikey = '203a2cda19958aea4076c585e27fb780';
    _url = 'api.themoviedb.org';
    _language = 'es-ES';
    _movies = [];
    _movie = Movie(title: '');
  }

  getOnDisplayMovies(String withGenres) async {
    var url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apikey,
      'language': _language,
      'page': (_random.nextInt(21)).toString(),
      'with_genres': withGenres,
    });
    final responce = await http.get(url);
    final popularResponce = PopularResponce.fromJson(responce.body);
    _movies = popularResponce.results;
    _movie = _movies[_random.nextInt(_movies.length)];
    notifyListeners();
  }

  getOnNowPlayingMovies() async {
    var url = Uri.https(_url, '3/movie/now_playing', {
      'api_key': _apikey,
      'language': _language,
    });
    final responce = await http.get(url);
    final popularResponce = PopularResponce.fromJson(responce.body);
    _movies = popularResponce.results;
    _movie = _movies[_random.nextInt(_movies.length)];
    notifyListeners();
  }

  List<Movie> getPeliculas() {
    return _movies;
  }

  Movie getPeliculaActual() {
    return _movie;
  }

  recargar() {
    _movie = _movies[_random.nextInt(_movies.length)];
    notifyListeners();
  }
}
