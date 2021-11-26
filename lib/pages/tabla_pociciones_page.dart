import 'package:flutter/material.dart';
import 'package:pictionaty_app/const/theme.dart';
import 'package:pictionaty_app/pages/home_page.dart';
import 'package:pictionaty_app/pages/ruleta_generos.dart';
import 'package:pictionaty_app/providers/equipo_provider.dart';
import 'package:pictionaty_app/providers/form_provider.dart';
import 'package:pictionaty_app/providers/movies_provider.dart';
import 'package:pictionaty_app/providers/state_provider.dart';
import 'package:pictionaty_app/providers/viewport_provider.dart';
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
    final viewport = Provider.of<ViewportProvider>(context);
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
            padding: EdgeInsets.only(
              left: viewport.getCalcWidth(0.03),
              right: viewport.getCalcWidth(0.03),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: viewport.getCalcHeight(0.03),
                    bottom: viewport.getCalcHeight(0.01),
                    left: viewport.getCalcWidth(0.03),
                  ),
                  child: Text(
                    "Puntuacion",
                    style: TextStyle(
                      color: mimodoTheme.primary,
                      fontSize: viewport.getCalcHeight(0.03),
                      fontFamily: mimodoTheme.fonts.title,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: viewport.getCalcWidth(0.03),
                    right: viewport.getCalcWidth(0.03),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 1,
                    color: mimodoTheme.secondary,
                  ),
                ),
                SizedBox(
                  height: viewport.getCalcHeight(0.02),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Container(
                      color: Colors.white, //grey.shade600,
                      width: viewport.getCalcWidth(0.88),
                      height: viewport.getCalcHeight(0.6),
                      child: const Tablero()),
                ),
                SizedBox(
                  height: viewport.getCalcHeight(0.1),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: viewport.getCalcWidth(0.03),
                    right: viewport.getCalcWidth(0.03),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: viewport.getCalcHeight(0.1),
                    decoration: BoxDecoration(
                      color: mimodoTheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      child: Text(
                        textButtom,
                        style: TextStyle(
                          color: mimodoTheme.background,
                          fontSize: viewport.getCalcHeight(0.05),
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
