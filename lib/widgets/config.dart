import 'package:flutter/material.dart';
import 'package:mimo_do/const/theme.dart';
import 'package:mimo_do/providers/equipo_provider.dart';
import 'package:mimo_do/providers/viewport_provider.dart';

Column tiempoJuego(EquipoProvider equipoProvider, ViewportProvider viewport) {
  return Column(
    children: [
      Center(
        child: Padding(
          padding: EdgeInsets.only(
            top: viewport.getCalcHeight(0.04),
            bottom: viewport.getCalcHeight(0.02),
          ),
          child: Text(
            "Tiempo de juego",
            style: TextStyle(
              color: mimodoTheme.primary,
              fontSize: viewport.getCalcHeight(0.03),
              fontFamily: mimodoTheme.fonts.title,
            ),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: viewport.getCalcWidth(0.11),
            height: viewport.getCalcWidth(0.11),
            decoration: BoxDecoration(
              color: mimodoTheme.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: viewport.getCalcHeight(0.05),
              ),
              onPressed: () {
                if (equipoProvider.getTiempoJuego() < 180) {
                  equipoProvider
                      .setTiempoJuego(equipoProvider.getTiempoJuego() + 10);
                }
              },
            ),
          ),
          SizedBox(
            width: viewport.getCalcWidth(0.2),
            child: Center(
              child: Text(equipoProvider.getTiempoJuego().toString(),
                  style: TextStyle(
                    color: mimodoTheme.primary,
                    fontSize: viewport.getCalcHeight(0.06),
                    fontFamily: mimodoTheme.fonts.textBold,
                  )),
            ),
          ),
          Container(
            width: viewport.getCalcWidth(0.11),
            height: viewport.getCalcWidth(0.11),
            decoration: BoxDecoration(
              color: mimodoTheme.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
                child: Icon(
                  Icons.remove,
                  color: Colors.white,
                  size: viewport.getCalcHeight(0.05),
                ),
                onPressed: () {
                  if (equipoProvider.getTiempoJuego() > 30) {
                    equipoProvider
                        .setTiempoJuego(equipoProvider.getTiempoJuego() - 10);
                  }
                }),
          ),
        ],
      ),
    ],
  );
}

Column rondas(EquipoProvider equipoProvider, ViewportProvider viewport) {
  return Column(
    children: [
      Center(
        child: Padding(
          padding: EdgeInsets.only(
            top: viewport.getCalcHeight(0.04),
            bottom: viewport.getCalcHeight(0.02),
          ),
          child: Text(
            "Rondas",
            style: TextStyle(
              color: mimodoTheme.primary,
              fontSize: viewport.getCalcHeight(0.03),
              fontFamily: mimodoTheme.fonts.title,
            ),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: viewport.getCalcWidth(0.11),
            height: viewport.getCalcWidth(0.11),
            decoration: BoxDecoration(
              color: mimodoTheme.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: viewport.getCalcHeight(0.05),
              ),
              onPressed: () {
                if (equipoProvider.getRonda() < 20) {
                  equipoProvider.setRonda(equipoProvider.getRonda() + 1);
                }
              },
            ),
          ),
          SizedBox(
            width: viewport.getCalcWidth(0.2),
            child: Center(
              child: Text(equipoProvider.getRonda().toString(),
                  style: TextStyle(
                    color: mimodoTheme.primary,
                    fontSize: viewport.getCalcHeight(0.06),
                    fontFamily: mimodoTheme.fonts.textBold,
                  )),
            ),
          ),
          Container(
            width: viewport.getCalcWidth(0.11),
            height: viewport.getCalcWidth(0.11),
            decoration: BoxDecoration(
              color: mimodoTheme.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton(
                child: Icon(
                  Icons.remove,
                  color: Colors.white,
                  size: viewport.getCalcHeight(0.05),
                ),
                onPressed: () {
                  if (equipoProvider.getRonda() > 5) {
                    equipoProvider.setRonda(equipoProvider.getRonda() - 1);
                  }
                }),
          ),
        ],
      ),
    ],
  );
}
