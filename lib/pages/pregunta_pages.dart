import 'package:flutter/material.dart';
import 'package:mimo_do/const/theme.dart';
import 'package:mimo_do/pages/tabla_posiciones_page.dart';
import 'package:mimo_do/providers/equipo_provider.dart';
import 'package:mimo_do/providers/movies_provider.dart';
import 'package:mimo_do/providers/viewport_provider.dart';
import 'package:mimo_do/widgets/main_app_bar.dart';
import 'package:provider/provider.dart';

class PreguntaPage extends StatelessWidget {
  const PreguntaPage({Key? key}) : super(key: key);
  static const String routeName = 'pregunta';

  @override
  Widget build(BuildContext context) {
    final viewport = Provider.of<ViewportProvider>(context);
    final moviesProvider = Provider.of<MoviesProvider>(context);
    final equipoProvider = Provider.of<EquipoProvider>(context);

    final mainAppBar = MimoAppbar();
    return Scaffold(
        appBar: mainAppBar.getWidget(context),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: mimodoTheme.background,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: viewport.getCalcHeight(0.05)),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.white,
                          offset: Offset(0, 0),
                          blurRadius: 10,
                          spreadRadius: 3)
                    ],
                    //borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                        width: viewport.getCalcWidth(0.025),
                        color: Colors.black),
                  ),
                  width: viewport.getCalcWidth(0.5),
                  height: viewport.getCalcHeight(0.5),
                  child: GestureDetector(
                    child: ClipRRect(
                      child: FadeInImage(
                          placeholder: const AssetImage('assets/signo.png'),
                          image: NetworkImage(
                              moviesProvider.getPeliculaActual().fullPosterImg),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: viewport.getCalcHeight(0.04),
                    bottom: viewport.getCalcHeight(0.02)),
                child: Text(
                  'Fin de la ronda',
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: viewport.getCalcHeight(0.04),
                    fontFamily: mimodoTheme.fonts.title,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: viewport.getCalcHeight(0.15),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: viewport.getCalcHeight(0.02),
                    bottom: viewport.getCalcHeight(0.04),
                    left: viewport.getCalcWidth(0.04),
                  ),
                  child: Text(
                    'La pelicula era ${moviesProvider.getPeliculaActual().title} ¿Acertaron?',
                    style: TextStyle(
                      color: mimodoTheme.primary,
                      fontSize: viewport.getCalcHeight(0.04),
                      fontFamily: mimodoTheme.fonts.title,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: viewport.getCalcWidth(0.3),
                  ),
                  Container(
                    width: viewport.getCalcWidth(0.12),
                    height: viewport.getCalcWidth(0.12),
                    decoration: BoxDecoration(
                      color: mimodoTheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      child: Text(
                        "Si",
                        style: TextStyle(
                          color: mimodoTheme.background,
                          fontSize: viewport.getCalcHeight(0.03),
                          fontFamily: mimodoTheme.fonts.title,
                        ),
                      ),
                      //como la ronda actual inicia en 0 se le suma 1

                      onPressed: () {
                        equipoProvider.setPuntosEquipo(equipoProvider
                            .traermeEquipo(equipoProvider.getRondaActual()));
                        equipoProvider.setRondaActual();
                        moviesProvider.setPeliculaActual();
                        Navigator.pushNamed(
                            context, TablaPosicionesPage.routeName);
                      },
                    ),
                  ),
                  SizedBox(
                    width: viewport.getCalcHeight(0.1),
                  ),
                  Container(
                    width: viewport.getCalcWidth(0.12),
                    height: viewport.getCalcWidth(0.12),
                    decoration: BoxDecoration(
                      color: mimodoTheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      child: Text(
                        "No",
                        style: TextStyle(
                          color: mimodoTheme.background,
                          fontSize: viewport.getCalcHeight(0.03),
                          fontFamily: mimodoTheme.fonts.title,
                        ),
                      ),
                      onPressed: () {
                        equipoProvider.setRondaActual();
                        moviesProvider.setPeliculaActual();
                        Navigator.pushNamed(
                            context, TablaPosicionesPage.routeName);
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
