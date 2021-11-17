import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:pictionaty_app/const/theme.dart';
import 'package:pictionaty_app/models/movie.dart';
import 'package:pictionaty_app/providers/movies_provider.dart';
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
    moviesProvider.getOnDisplayMovies();
    final Movie movie = moviesProvider.getPelicula();
    bool isTap = false;
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
                        image: NetworkImage(movie.fullPosterImg),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: viewport.getHeight() * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                width: double.infinity,
                alignment: Alignment.topCenter,
                height: 80,
                child: Text(
                  movie.title,
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: mimodoTheme.fonts.title,
                  ),
                ),
              ),
            ),
            Container(
              width: viewport.getWidth() * 0.12,
              height: viewport.getHeight() * 0.08,
              decoration: BoxDecoration(
                color: mimodoTheme.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                  onPressed: () {
                    moviesProvider.recargar();
                  },
                  child: Icon(
                    Icons.replay_outlined,
                    color: mimodoTheme.background,
                    size: 20,
                  )),
            ),
            SizedBox(
              height: viewport.getHeight() * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: mimodoTheme.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Contador(
                    isTap: isTap,
                    titulo: movie.title,
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class Contador extends StatefulWidget {
  const Contador({Key? key, required this.isTap, required this.titulo})
      : super(key: key);

  final bool isTap;
  final String titulo;

  @override
  State<Contador> createState() => _ContadorState(isTap: isTap, titulo: titulo);
}

class _ContadorState extends State<Contador> {
  _ContadorState({required this.isTap, required this.titulo});

  bool isTap;
  String titulo;
  @override
  Widget build(BuildContext context) {
    Widget result = Column();

    if (isTap) {
      result = CountdownTimer(
        endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 20,
        textStyle: TextStyle(
          color: mimodoTheme.background,
          fontSize: 30,
          fontFamily: mimodoTheme.fonts.title,
        ),
        onEnd: () {
          setState(() {
            isTap = false;
          });
        },
      );
    } else {
      result = TextButton(
        child: Text(
          "Listo",
          style: TextStyle(
            color: mimodoTheme.background,
            fontSize: 30,
            fontFamily: mimodoTheme.fonts.title,
          ),
        ),
        onPressed: () {
          setState(() {
            isTap = true;
          });
        },
      );
    }
    return result;
  }
}

class Countdawn extends StatelessWidget {
  const Countdawn({Key? key, required this.titulo}) : super(key: key);
  final String titulo;
  @override
  Widget build(BuildContext context) {
    final viewport = Provider.of<ViewportProvider>(context);
    return Container(
      alignment: Alignment.center,
      child: Countdown(
        seconds: 2,
        build: (BuildContext context, double time) => Text(
          time.toString(),
          style: TextStyle(
            color: mimodoTheme.background,
            fontSize: 30,
            fontFamily: mimodoTheme.fonts.title,
          ),
        ),
        interval: const Duration(milliseconds: 100),
        onFinished: () {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                  backgroundColor: mimodoTheme.background,
                  title: Text(
                    'Fin de la ronda',
                    style: TextStyle(
                      color: mimodoTheme.primary, //mimodoTheme.background,
                      fontSize: 30,
                      fontFamily: mimodoTheme.fonts.title,
                    ),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'La pelicula era $titulo. ¿Acertaron?',
                        style: TextStyle(
                          color: mimodoTheme.primary,
                          fontSize: 20,
                          fontFamily: mimodoTheme.fonts.title,
                        ),
                      ),
                      Row(
                        children: [
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
                              onPressed: () {},
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
                              onPressed: () {},
                            ),
                          )
                        ],
                      )
                    ],
                  )));
        },
      ),
    );
  }
}
