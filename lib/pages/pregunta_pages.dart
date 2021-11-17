import 'package:flutter/material.dart';
import 'package:pictionaty_app/const/theme.dart';
import 'package:pictionaty_app/pages/tabla_pociciones_page.dart';
import 'package:pictionaty_app/providers/movies_provider.dart';
import 'package:pictionaty_app/providers/viewport_provider.dart';
import 'package:pictionaty_app/widgets/main_app_bar.dart';
import 'package:provider/provider.dart';

class PreguntaPage extends StatelessWidget {
  const PreguntaPage({Key? key}) : super(key: key);
  static const String routeName = 'pregunta';

  @override
  Widget build(BuildContext context) {
    final viewport = Provider.of<ViewportProvider>(context);
    final moviesProvider = Provider.of<MoviesProvider>(context);
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
                padding: EdgeInsets.only(top: viewport.getHeight() * 0.05),
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
                    border: Border.all(width: 10, color: Colors.black),
                  ),
                  width: viewport.getWidth() * 0.5,
                  height: viewport.getHeight() * 0.5,
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
                    top: viewport.getHeight() * 0.04,
                    bottom: viewport.getHeight() * 0.02),
                child: Text(
                  'Fin de la ronda',
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: mimodoTheme.fonts.title,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: viewport.getHeight() * 0.04,
                    bottom: viewport.getHeight() * 0.04),
                child: Text(
                  'La pelicula era ${moviesProvider.getPeliculaActual().title} ¿Acertaron?',
                  style: TextStyle(
                    color: mimodoTheme.primary,
                    fontSize: 20,
                    fontFamily: mimodoTheme.fonts.title,
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: viewport.getWidth() * 0.3,
                  ),
                  Container(
                    width: viewport.getWidth() * 0.12,
                    height: viewport.getHeight() * 0.08,
                    decoration: BoxDecoration(
                      color: mimodoTheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      child: Text(
                        "Si",
                        style: TextStyle(
                          color: mimodoTheme.background,
                          fontSize: 20,
                          fontFamily: mimodoTheme.fonts.title,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                            context, TablaPosicionesPage.routeName);
                      },
                    ),
                  ),
                  SizedBox(
                    width: viewport.getWidth() * 0.05,
                  ),
                  Container(
                    width: viewport.getWidth() * 0.12,
                    height: viewport.getHeight() * 0.08,
                    decoration: BoxDecoration(
                      color: mimodoTheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      child: Text(
                        "No",
                        style: TextStyle(
                          color: mimodoTheme.background,
                          fontSize: 20,
                          fontFamily: mimodoTheme.fonts.title,
                        ),
                      ),
                      onPressed: () {
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
