import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mimo_do/const/theme.dart';
import 'package:mimo_do/pages/pregunta_pages.dart';
import 'package:mimo_do/providers/equipo_provider.dart';
import 'package:mimo_do/providers/state_provider.dart';
import 'package:mimo_do/providers/viewport_provider.dart';
import 'package:provider/provider.dart';
import 'package:timer_count_down/timer_count_down.dart';

class Contador extends StatelessWidget {
  const Contador({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewport = Provider.of<ViewportProvider>(context);
    final stateProvider = Provider.of<StateProvider>(context);
    Widget result = Column();

    if (stateProvider.getIsTap()) {
      result = const Countdawn();
    } else {
      result = TextButton(
        child: Text(
          "Comenzar",
          style: TextStyle(
            color: mimodoTheme.background,
            fontSize: viewport.getCalcHeight(0.05),
            fontFamily: mimodoTheme.fonts.title,
          ),
        ),
        onPressed: () {
          stateProvider.setIsTap(true);
          stateProvider.setComenzo(true);
        },
      );
    }
    return result;
  }
}

class Countdawn extends StatelessWidget {
  const Countdawn({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final viewport = Provider.of<ViewportProvider>(context);
    final stateProvider = Provider.of<StateProvider>(context);
    final equipoProvider = Provider.of<EquipoProvider>(context);

    return Container(
      alignment: Alignment.center,
      child: Countdown(
        seconds: equipoProvider.getTiempoJuego(),
        build: (BuildContext context, double time) => Text(
          time.toString(),
          style: TextStyle(
            color: mimodoTheme.background,
            fontSize: viewport.getCalcHeight(0.05),
            fontFamily: mimodoTheme.fonts.title,
          ),
        ),
        interval: const Duration(milliseconds: 100),
        onFinished: () {
          stateProvider.setIsTap(false);

          stateProvider.setComenzo(false);
          Navigator.pushNamed(context, PreguntaPage.routeName);
        },
      ),
    );
  }
}
