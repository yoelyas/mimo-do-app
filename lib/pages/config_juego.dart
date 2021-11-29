import 'package:flutter/material.dart';
import 'package:mimo_do/const/theme.dart';
import 'package:mimo_do/pages/tabla_posiciones_page.dart';
import 'package:mimo_do/providers/equipo_provider.dart';
import 'package:mimo_do/providers/viewport_provider.dart';
import 'package:mimo_do/widgets/drawer_bar.dart';
import 'package:mimo_do/widgets/main_app_bar.dart';
import 'package:provider/provider.dart';

class ConfigJuegoPage extends StatelessWidget {
  static const String routeName = 'juego';
  const ConfigJuegoPage({Key? key}) : super(key: key);

  get loginForm => null;

  @override
  Widget build(BuildContext context) {
    final equipoProvider = Provider.of<EquipoProvider>(context);
    final viewport = Provider.of<ViewportProvider>(context);
    final mainAppBar = MimoAppbar();
    return Scaffold(
      appBar: mainAppBar.getWidget(context),
      drawer: SideBarMenu(
        context: context,
      ),
      body: Container(
          color: mimodoTheme.background,
          child: Padding(
            padding: EdgeInsets.only(
                top: viewport.getCalcHeight(0.05),
                left: viewport.getCalcWidth(0.04),
                right: viewport.getCalcWidth(0.04)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Configuracion de partida",
                  style: TextStyle(
                    color: mimodoTheme.primary,
                    fontSize: viewport.getCalcHeight(0.04),
                    fontFamily: mimodoTheme.fonts.title,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: mimodoTheme.secondary,
                ),
                SizedBox(
                  height: viewport.getCalcHeight(0.1),
                ),
                Align(
                  child: Container(
                      color: Colors.white, //grey.shade600,
                      width: viewport.getCalcWidth(0.5),
                      height: viewport.getCalcHeight(0.5),
                      child: Column(
                        children: [
                          Expanded(
                              child: tiempoJuego(equipoProvider, viewport)),
                          Expanded(child: rondas(equipoProvider, viewport)),
                        ],
                      )),
                ),
                SizedBox(
                  height: viewport.getCalcHeight(0.1),
                ),
                Container(
                  width: double.infinity,
                  height: viewport.getCalcHeight(0.1),
                  decoration: BoxDecoration(
                    color: mimodoTheme.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                    child: Text(
                      "Continuar",
                      style: TextStyle(
                        color: mimodoTheme.background,
                        fontSize: viewport.getCalcHeight(0.04),
                        fontFamily: mimodoTheme.fonts.title,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                          context, TablaPosicionesPage.routeName);
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }

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
}
