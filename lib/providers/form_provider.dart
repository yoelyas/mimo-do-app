import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  //GlobalKey<FormState> formKey = GlobalKey<FormState>(debugLabel: 'loginForm');

  Map<int, String> _equipos = {
    1: 'equipo 1',
    2: 'equipo 2',
    3: 'equipo 3',
    4: 'equipo 4',
  };
  reset() {
    //formKey = GlobalKey<FormState>(debugLabel: 'loginForm');
    _equipos = {
      1: 'equipo 1',
      2: 'equipo 2',
      3: 'equipo 3',
      4: 'equipo 4',
    };
  }

  setNombreEquipo(numero, nombre) {
    _equipos[numero] = nombre;
  }

  getNombreEquipos() => _equipos;

  /*bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }*/
}
