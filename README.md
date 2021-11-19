# pictionaty_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Configuración

Crear archivo en `lib/const/config.dart`.

Ejemplo de `config.dart`
```dart
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pictionaty_app/models/movie.dart';
import 'package:pictionaty_app/models/peliculas_responce.dart';

class MoviesProvider extends ChangeNotifier {
  final Random _random = Random();
  final String _apikey = //Clave de la API de The Movie Database;
  final String _url = 'api.themoviedb.org';
  final String _language = 'es-ES';
  List<Movie> _movies = [];
  Movie _movie = Movie(title: '');

  /*MoviesProvider() {
    getOnDisplayMovies();
  }*/

  getOnDisplayMovies(String withGenres) async {
    var url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apikey,
      'language': _language,
      'page': (_random.nextInt(20) + 1).toString(),
      'with_genres': withGenres,
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


```