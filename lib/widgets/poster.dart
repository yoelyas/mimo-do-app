import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mimo_do/const/theme.dart';
import 'package:mimo_do/models/movie.dart';
import 'package:mimo_do/providers/movies_provider.dart';
import 'package:mimo_do/providers/state_provider.dart';
import 'package:mimo_do/providers/viewport_provider.dart';
import 'package:provider/provider.dart';

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
                child: FadeInImage(
                    placeholder: const AssetImage('assets/signo.png'),
                    image: NetworkImage(widget.movie.fullPosterImg),
                    fit: BoxFit.fill),
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
                boxShadow: [
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
