// import 'package:flutter/material.dart';

// ignore: constant_identifier_names
const Map<String, Map<String, dynamic>> APP_CONFIG = {
  "appBar": {
    "logo": "assets/logo.png",
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
