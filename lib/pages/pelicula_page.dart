import 'package:flutter/material.dart';
import 'package:pictionaty_app/const/theme.dart';
import 'package:pictionaty_app/models/movie.dart';
import 'package:pictionaty_app/pages/pregunta_pages.dart';
import 'package:pictionaty_app/providers/equipo_provider.dart';
import 'package:pictionaty_app/providers/movies_provider.dart';
import 'package:pictionaty_app/providers/state_provider.dart';
import 'package:pictionaty_app/providers/viewport_provider.dart';
import 'package:pictionaty_app/widgets/main_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:timer_count_down/timer_count_down.dart';

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
              width: viewport.getCalcWidth(0.11),
              height: viewport.getCalcWidth(0.11),
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
                  top: viewport.getCalcHeight(0.02),
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

class TituloPelicula extends StatelessWidget {
  const TituloPelicula({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final viewport = Provider.of<ViewportProvider>(context);
    return Padding(
      padding: EdgeInsets.only(
          top: viewport.getCalcHeight(0.02),
          left: viewport.getCalcWidth(0.02),
          right: viewport.getCalcWidth(0.02)),
      child: Container(
        width: double.infinity,
        height: viewport.getCalcWidth(0.2),
        alignment: Alignment.topCenter,
        child: Text(
          movie.title,
          maxLines: 3,
          style: TextStyle(
            color: Colors.white,
            fontSize: viewport.getCalcHeight(0.04),
            fontFamily: mimodoTheme.fonts.title,
          ),
        ),
      ),
    );
  }
}

class Poster extends StatefulWidget {
  const Poster({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  State<Poster> createState() => _PosterState();
}

class _PosterState extends State<Poster> {
  @override
  Widget build(BuildContext context) {
    final stateProvider = Provider.of<StateProvider>(context);
    final moviesProvider = Provider.of<MoviesProvider>(context);
    final viewport = Provider.of<ViewportProvider>(context);

    final Movie movie = moviesProvider.getPeliculaActual();

    if (!stateProvider.getIsTap()) {
      return Column(
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
                    width: viewport.getCalcWidth(0.025), color: Colors.black),
              ),
              width: viewport.getCalcWidth(0.6),
              height: viewport.getCalcHeight(0.5),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    stateProvider.setSoftIsTap(true);
                  });
                },
                child: ClipRRect(
                  child: FadeInImage(
                      placeholder: const AssetImage('assets/signo.png'),
                      image: NetworkImage(widget.movie.fullPosterImg),
                      fit: BoxFit.fill),
                ),
              ),
            ),
          ),
          TituloPelicula(
            movie: movie,
          )
        ],
      );
    } else {
      return Column(
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
                    width: viewport.getCalcWidth(0.025), color: Colors.black),
              ),
              width: viewport.getCalcWidth(0.6),
              height: viewport.getCalcHeight(0.5),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    stateProvider.setSoftIsTap(false);
                  });
                },
                child: const Image(
                  image: AssetImage('assets/signo.png'),
                ),
              ),
            ),
          ),
          SizedBox(
            height: viewport.getCalcWidth(0.228),
          )
        ],
      );
    }
  }
}

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
