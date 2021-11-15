import 'package:flutter/material.dart';
import 'package:pictionaty_app/models/teams.dart';

class EquipoProvider extends ChangeNotifier {
  final TeamCollection _teamCollection = TeamCollection();

  int _cantEquipos = 2;
  Map<String, int> _equipos = {};
  int _tiempoJuego = 120;
  int _rondas = 10;
  String _generoElejido = '';

  String getGeneroElejido() => _generoElejido;

  setGeneroElejido(String text) {
    _generoElejido = text;
  }

  setRonda(int rondas) {
    notifyListeners();
    _rondas = rondas;
  }

  getRonda() => _rondas;

  setTiempoJuego(int tiempoJuego) {
    _tiempoJuego = tiempoJuego;
    notifyListeners();
  }

  getTiempoJuego() => _tiempoJuego;

  ejecutarRonda() {
    for (Team team in _teamCollection) {
      team.getPoints();
    }

    _teamCollection.map((e) {
      e.getName();
    });
  }

  setCastEquipos(int cantEquipos) {
    _cantEquipos = cantEquipos;
    notifyListeners();
  } // Getters

  int getCantEquipos() => _cantEquipos;

  void initialize(Map<int, String> equipos) {
    equipos.forEach((key, value) {
      if (_cantEquipos >= key) {
        _equipos[value] = 0;
      }
    });
  }

  String traermeEquipo(int equipo) {
    int count = 0;
    String name = "";

    _equipos.forEach((key, value) {
      // ignore: unrelated_type_equality_checks
      count++;

      if (count == equipo) {
        name = key;
      }
    });

    return name;
  }

  setEquipo(Map<String, int> equipoFinal) {
    _equipos = equipoFinal;
  }

  setPuntosEquipo(String equipo, int puntos) {
    if (_equipos.containsKey(equipo)) {
      _equipos[equipo] = puntos;
    }
  }

  traermePuntuacionEquipo(int equipo) {
    int count = 0;
    int puntuacion = 0;

    _equipos.forEach((key, value) {
      // ignore: unrelated_type_equality_checks
      count++;

      if (count == equipo) {
        puntuacion = value;
      }
    });

    return puntuacion;
  }
}
