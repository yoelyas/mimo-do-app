import 'package:flutter/material.dart';
import 'package:mimo_do/const/theme.dart';
import 'package:mimo_do/models/movie.dart';
import 'package:mimo_do/pages/pregunta_pages.dart';
import 'package:mimo_do/providers/movies_provider.dart';
import 'package:mimo_do/providers/state_provider.dart';
import 'package:mimo_do/providers/viewport_provider.dart';
import 'package:mimo_do/widgets/cronometro.dart';
import 'package:mimo_do/widgets/main_app_bar.dart';
import 'package:mimo_do/widgets/poster.dart';
import 'package:provider/provider.dart';

class PeliculaPage extends StatelessWidget {
  const PeliculaPage({Key? key}) : super(key: key);

  static const String routeName = 'pelicula';

  @override
  Widget build(BuildContext context) {
    final viewport = Provider.of<ViewportProvider>(context);
    final mainAppBar = MimoAppbar();
    final moviesProvider = Provider.of<MoviesProvider>(context);
    final stateProvider = Provider.of<StateProvider>(context);

    final Movie movie = moviesProvider.getPeliculaActual();

    if (moviesProvider.getPeliculas().isEmpty) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        child: const Center(child: CircularProgressIndicator()),
        color: mimodoTheme.background,
      );
    }

    return Scaffold(
      appBar: mainAppBar.getWidget(context),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: mimodoTheme.background,
        child: Column(
          children: [
            Poster(
              movie: movie,
            ),
            SizedBox(
              height: viewport.getCalcWidth(0.01),
            ),
            Container(
              width: viewport.getCalcWidth(0.12),
              height: viewport.getCalcWidth(0.12),
              decoration: BoxDecoration(
                color: mimodoTheme.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                  onPressed: () {
                    if (!stateProvider.getComenzo()) {
                      moviesProvider.recargar();
                    }
                  },
                  child: Icon(
                    Icons.replay_outlined,
                    color: mimodoTheme.background,
                    size: viewport.getCalcHeight(0.05),
                  )),
            ),
            SizedBox(
              height: viewport.getCalcHeight(0.01),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: viewport.getCalcHeight(0.01),
                  left: viewport.getCalcWidth(0.04),
                  right: viewport.getCalcWidth(0.04)),
              child: GestureDetector(
                onTap: () {
                  stateProvider.setIsTap(false);
                  stateProvider.setComenzo(false);
                  Navigator.pushNamed(context, PreguntaPage.routeName);
                },
                child: Container(
                    width: double.infinity,
                    height: viewport.getCalcHeight(0.1),
                    decoration: BoxDecoration(
                      color: mimodoTheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Contador()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
