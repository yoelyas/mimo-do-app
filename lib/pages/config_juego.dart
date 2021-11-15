import 'package:flutter/material.dart';
import 'package:pictionaty_app/const/theme.dart';
import 'package:pictionaty_app/pages/tabla_pociciones_page.dart';
import 'package:pictionaty_app/providers/equipo_provider.dart';
import 'package:pictionaty_app/widgets/drawer_bar.dart';
import 'package:pictionaty_app/widgets/main_app_bar.dart';
import 'package:provider/provider.dart';

class ConfigJuegoPage extends StatelessWidget {
  static const String routeName = 'juego';
  const ConfigJuegoPage({Key? key}) : super(key: key);

  get loginForm => null;

  @override
  Widget build(BuildContext context) {
    final equipoProvider = Provider.of<EquipoProvider>(context);
    final mainAppBar = MimoAppbar();
    return Scaffold(
      appBar: mainAppBar.getWidget(context),
      drawer: SideBarMenu(
        context: context,
      ),
      body: Container(
          color: mimodoTheme.background,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 10),
                  child: Text(
                    "Configuracion de partida",
                    style: TextStyle(
                      color: mimodoTheme.primary,
                      fontSize: 15,
                      fontFamily: mimodoTheme.fonts.title,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: mimodoTheme.secondary,
                ),
                const SizedBox(
                  height: 35,
                ),
                Align(
                  child: Container(
                      color: Colors.white, //grey.shade600,
                      width: 200,
                      height: 300,
                      child: Column(
                        children: [
                          Expanded(child: tiempoJuego(equipoProvider)),
                          Expanded(child: rondas(equipoProvider)),
                        ],
                      )),
                ),
                const SizedBox(
                  height: 35,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: mimodoTheme.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                    child: Text(
                      "Continuar",
                      style: TextStyle(
                        color: mimodoTheme.background,
                        fontSize: 30,
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

  Column tiempoJuego(EquipoProvider equipoProvider) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 10),
            child: Text(
              "Tiempo de juego",
              style: TextStyle(
                color: mimodoTheme.primary,
                fontSize: 15,
                fontFamily: mimodoTheme.fonts.title,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              color: mimodoTheme.primary,
              child: TextButton(
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 26,
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
              width: 60,
              child: Center(
                child: Text(equipoProvider.getTiempoJuego().toString(),
                    style: TextStyle(
                      color: mimodoTheme.primary,
                      fontSize: 26,
                      fontFamily: mimodoTheme.fonts.textBold,
                    )),
              ),
            ),
            Container(
              width: 40,
              height: 40,
              color: mimodoTheme.primary,
              child: TextButton(
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                    size: 26,
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

  Column rondas(EquipoProvider equipoProvider) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 10),
            child: Text(
              "Rondas",
              style: TextStyle(
                color: mimodoTheme.primary,
                fontSize: 15,
                fontFamily: mimodoTheme.fonts.title,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              color: mimodoTheme.primary,
              child: TextButton(
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 26,
                ),
                onPressed: () {
                  if (equipoProvider.getRonda() < 20) {
                    equipoProvider.setRonda(equipoProvider.getRonda() + 1);
                  }
                },
              ),
            ),
            SizedBox(
              width: 60,
              child: Center(
                child: Text(equipoProvider.getRonda().toString(),
                    style: TextStyle(
                      color: mimodoTheme.primary,
                      fontSize: 26,
                      fontFamily: mimodoTheme.fonts.textBold,
                    )),
              ),
            ),
            Container(
              width: 40,
              height: 40,
              color: mimodoTheme.primary,
              child: TextButton(
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                    size: 26,
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
