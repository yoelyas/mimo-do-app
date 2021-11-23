import 'package:flutter/material.dart';
import 'package:pictionaty_app/models/teams.dart';

class EquipoProvider extends ChangeNotifier {
  TeamCollection _teamCollection = TeamCollection();

  int _cantEquipos = 2;
  Map<String, int> _equipos = {};
  int _tiempoJuego = 1;
  int _rondas = 1;
  String _generoElejido = '';
  int _rondaActual = 0;

  reset() {
    _teamCollection = TeamCollection();
    _cantEquipos = 2;
    _equipos = {};
    _tiempoJuego = 1;
    _rondas = 1;
    _generoElejido = '';
    _rondaActual = 0;
  }

  int getRondaActual() => _rondaActual;

  setRondaActual() {
    if (getRondaActual() < _cantEquipos - 1) {
      _rondaActual++;
    } else {
      setRonda(getRonda() - 1);
      _rondaActual = 0;
    }
  }

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

    _teamCollection.map((equipo) {
      equipo.getName();
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

  getEquipos() {
    return _equipos;
  }

  String traermeEquipo(int equipo) {
    int count = 0;
    String name = "";

    _equipos.forEach((key, value) {
      // ignore: unrelated_type_equality_checks
      if (count == equipo) {
        name = key;
      }
      count++;
    });
    return name;
  }

  setPuntosEquipo(
    String equipo,
  ) {
    if (_equipos.containsKey(equipo)) {
      _equipos[equipo] = _equipos[equipo]! + 2;
    }
  }

  traermePuntuacionEquipo(String equipo) {
    if (_equipos.containsKey(equipo)) {
      return _equipos[equipo];
    }
  }
}
