// import 'package:flutter/material.dart';

// ignore: constant_identifier_names
const Map<String, Map<String, dynamic>> APP_CONFIG = {
  "appBar": {
    "logo": "assets/logo_mimodo.png",
    "logo-gris": "assets/fondo_mimodo.png",
  },
  "drawer": {
    "avatar": "assets/500x300.png",
  },
  "gridBreakpoints": {
    "xs": 320.0, //*1
    "sm": 425.0,
    "md": 768.0, // *1.2
    "lg": 1024.0,
    "xl": 1200.0,
    //320
    // <= 425 es smallScreen
    // <= 768 es mediumScreen
    // <= 1200 es largeScreen
    // > 1200 es xLargeScreen
  },
};

const Map<String, String> genre = {
  "Acción": '28',
  "Aventura": '12',
  "Comedia": '35',
  "Drama": '18',
  "Fantasía": '14',
  "Terror": '27',
  "Romance": '10749',
  "C. ficción": '878',
};

int volumen = 0;

getIdGenero(String genero) {
  String id = '';
  genre.forEach((key, value) {
    if (genero == key) {
      id = value;
    }
  });
  return id;
}
