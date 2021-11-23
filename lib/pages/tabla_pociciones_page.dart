import 'package:flutter/material.dart';
import 'package:pictionaty_app/const/theme.dart';
import 'package:pictionaty_app/pages/home_page.dart';
import 'package:pictionaty_app/pages/ruleta_generos.dart';
import 'package:pictionaty_app/providers/equipo_provider.dart';
import 'package:pictionaty_app/providers/form_provider.dart';
import 'package:pictionaty_app/providers/movies_provider.dart';
import 'package:pictionaty_app/providers/state_provider.dart';
import 'package:pictionaty_app/widgets/drawer_bar.dart';
import 'package:pictionaty_app/widgets/main_app_bar.dart';
import 'package:pictionaty_app/widgets/tablero.dart';
import 'package:provider/provider.dart';

class TablaPosicionesPage extends StatelessWidget {
  static const String routeName = 'tablon';
  const TablaPosicionesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final equipoProvider = Provider.of<EquipoProvider>(context);
    final loginFormProvider = Provider.of<LoginFormProvider>(context);
    final moviesProvider = Provider.of<MoviesProvider>(context);
    final stateProvider = Provider.of<StateProvider>(context);
    final mainAppBar = MimoAppbar();
    String textButtom = "Listo";

    if (equipoProvider.getRonda() == 0) {
      textButtom = 'Nueva partida';
    }

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
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 10, left: 10),
                  child: Text(
                    "Puntuacion",
                    style: TextStyle(
                      color: mimodoTheme.primary,
                      fontSize: 15,
                      fontFamily: mimodoTheme.fonts.title,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 8),
                  child: Container(
                    width: double.infinity,
                    height: 1,
                    color: mimodoTheme.secondary,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Container(
                      color: Colors.white, //grey.shade600,
                      width: 350,
                      height: 300,
                      child: const Tablero()),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: mimodoTheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      child: Text(
                        textButtom,
                        style: TextStyle(
                          color: mimodoTheme.background,
                          fontSize: 30,
                          fontFamily: mimodoTheme.fonts.title,
                        ),
                      ),
                      onPressed: () {
                        if (equipoProvider.getRonda() > 0) {
                          Navigator.pushNamed(
                              context, RuletaDeGeneros.routeName);
                        } else {
                          loginFormProvider.reset();
                          moviesProvider.reset();
                          stateProvider.reset();
                          equipoProvider.reset();
                          Navigator.pushNamed(context, HomePage.routeName);
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
