import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pictionaty_app/const/config.dart';
import 'package:pictionaty_app/const/theme.dart';
import 'package:pictionaty_app/pages/pelicula_page.dart';
import 'package:pictionaty_app/providers/equipo_provider.dart';
import 'package:pictionaty_app/providers/movies_provider.dart';
import 'package:pictionaty_app/providers/viewport_provider.dart';
import 'package:pictionaty_app/widgets/drawer_bar.dart';
import 'package:pictionaty_app/widgets/main_app_bar.dart';
import 'package:provider/provider.dart';

class RuletaDeGeneros extends StatefulWidget {
  static const String routeName = 'ruleta';
  const RuletaDeGeneros({Key? key}) : super(key: key);

  @override
  State<RuletaDeGeneros> createState() => _RuletaDeGenerosState();
}

class _RuletaDeGenerosState extends State<RuletaDeGeneros> {
  late double ancho;
  late double alto;
  int currentFrame = 0;
  int duration = 100;
  int timerDuration = 0;

  late Timer timer;
  bool isRunningAnimation = false;
  bool isStarting = false;
  bool isStopping = false;

  List<String> generos = [
    "Acción",
    "Aventura",
    "Comedia",
    "Drama",
    "Fantasía",
    "Terror",
    "Romance",
    "C. ficción",
  ];

  int offset = 0;

  Map<String, String> ruleta = {
    'Card-1': '',
    'Card-2': '',
    'Card-3': '',
    'Card-4': '',
    'Card-5': '',
    'Card-6': '',
  };

  Map<int, CardPosition> cardPositionMap = {
    0: CardPosition(
      percentWidth: 0.5,
      percentHeight: 0.15,
      percentY: 0,
    ),
    1: CardPosition(
      percentWidth: (0.9 - 0.5) / 2 + 0.5,
      percentHeight: 0.2,
      percentY: (0.25 - (0.2 / 2)),
    ),
    2: CardPosition(
      percentWidth: 0.9,
      percentHeight: 0.3,
      percentY: (0.5 - (0.3 / 2)),
    ),
    3: CardPosition(
      percentWidth: (0.9 - 0.5) / 2 + 0.5,
      percentHeight: 0.2,
      percentY: (0.75 - (0.2 / 2)),
    ),
    4: CardPosition(
      percentWidth: 0.5,
      percentHeight: 0.15,
      percentY: (1 - 0.15),
    ),
    5: CardPosition(
      percentWidth: 0.2,
      percentHeight: 0.1,
      percentY: (0.5 - (0.1 / 2)),
    ),
  };

  Map<int, List<Caja>> keyFrames = {
    0: [
      Caja('Card-1'),
      Caja('Card-2'),
      Caja('Card-3'),
      Caja('Card-4'),
      Caja('Card-5'),
      Caja('Card-6'),
    ],
    1: [
      Caja('Card-6'),
      Caja('Card-1'),
      Caja('Card-2'),
      Caja('Card-3'),
      Caja('Card-4'),
      Caja('Card-5'),
    ],
    2: [
      Caja('Card-5'),
      Caja('Card-6'),
      Caja('Card-1'),
      Caja('Card-2'),
      Caja('Card-3'),
      Caja('Card-4'),
    ],
    3: [
      Caja('Card-4'),
      Caja('Card-5'),
      Caja('Card-6'),
      Caja('Card-1'),
      Caja('Card-2'),
      Caja('Card-3'),
    ],
    4: [
      Caja('Card-3'),
      Caja('Card-4'),
      Caja('Card-5'),
      Caja('Card-6'),
      Caja('Card-1'),
      Caja('Card-2'),
    ],
    5: [
      Caja('Card-2'),
      Caja('Card-3'),
      Caja('Card-4'),
      Caja('Card-5'),
      Caja('Card-6'),
      Caja('Card-1'),
    ],
  };

  @override
  Widget build(BuildContext context) {
    final viewport = Provider.of<ViewportProvider>(context);
    final moviesProvider = Provider.of<MoviesProvider>(context);
    final equipoProvider = Provider.of<EquipoProvider>(context);
    viewport.setContext(context);
    ancho = viewport.getCalcWidth(0.75);
    alto = viewport.getCalcHeight(0.5);
    final mainAppBar = MimoAppbar();
    IconData buttom = Icons.play_arrow;
    if (!isRunningAnimation) {
      buttom = Icons.play_arrow;
    } else {
      buttom = Icons.pause;
    }

    return Scaffold(
      appBar: mainAppBar.getWidget(context),
      drawer: SideBarMenu(
        context: context,
      ),

      body: Container(
        padding: const EdgeInsets.only(top: 30),
        width: double.infinity,
        height: double.infinity,
        color: mimodoTheme.background,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 270,
                  child: Icon(
                    Icons.arrow_forward,
                    color: mimodoTheme.primary,
                    size: 50,
                  ),
                ),
                Expanded(
                  child: Stack(
                      alignment: Alignment.topCenter,
                      children: getKeyFrame(currentFrame)),
                ),
                SizedBox(
                  height: 270,
                  child: Icon(
                    Icons.arrow_back,
                    color: mimodoTheme.primary,
                    size: 50,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: mimodoTheme.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: OutlinedButton(
                  onPressed: () {
                    if (!isRunningAnimation) {
                      startAnimation();
                    } else {
                      stopAnimation();
                    }
                  },
                  child: Icon(
                    buttom,
                    color: mimodoTheme.background,
                    size: 20,
                  )),
            ),
            const SizedBox(
              height: 40,
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
                child: TextButton(
                  child: Text(
                    "Listo",
                    style: TextStyle(
                      color: mimodoTheme.background,
                      fontSize: 30,
                      fontFamily: mimodoTheme.fonts.title,
                    ),
                  ),
                  onPressed: () {
                    if (!isRunningAnimation) {
                      moviesProvider.getOnDisplayMovies(
                          getIdGenero(equipoProvider.getGeneroElejido()));
                      Navigator.pushNamed(context, PeliculaPage.routeName);
                    } else //(!isStopping)
                    {
                      stopAnimation();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      //
    );
  }

  /// personalizacion de la caja
  List<Caja> getKeyFrame(int key) {
    final keyFrame = keyFrames[key]!;

    // reinicio siempre el texto de la primera caja
    ruleta[keyFrame[0].id] = "";

    for (var i = 0; i < keyFrame.length; i++) {
      // keyFrame[i] = Caja en la pos i del keyframe
      String generoCaja = ruleta[keyFrame[i].id]!;
      if (generoCaja.isEmpty) {
        ruleta[keyFrame[i].id] = generos[offset];

        if (offset < (generos.length - 1)) {
          offset++;
        } else {
          offset = 0;
        }
      }

      keyFrame[i].text = ruleta[keyFrame[i].id]!;
      keyFrame[i].duration = timerDuration;
      keyFrame[i].width = cardPositionMap[i]!.percentWidth * ancho;
      keyFrame[i].height = cardPositionMap[i]!.percentHeight * alto;
      keyFrame[i].y = cardPositionMap[i]!.percentY * alto;
    }

    List<Caja> stack = [
      keyFrames[key]![5],
      keyFrames[key]![0],
      keyFrames[key]![1],
      keyFrames[key]![4],
      keyFrames[key]![3],
      keyFrames[key]![2],
    ]; // = keyFrames[key]!;

    /*
      Caja('Card-6'), // 5
      Caja('Card-5'), // 4
      Caja('Card-4'), // 3     
      Caja('Card-1'), // 0
      Caja('Card-2'), // 1
      Caja('Card-3'), // 2
      */

    return stack;
  }

  startAnimation() {
    isRunningAnimation = true;
    isStarting = true;
    timerDuration = 500;
    runAnimation();
  }

  runAnimation() {
    handleTimeout();
    if (isStarting) {
      if (timerDuration > duration) {
        // Desacelerar implica aumentar la duracion entre
        int tmpDuration = (timerDuration * 0.7).toInt();
        if (tmpDuration > duration) {
          timerDuration = tmpDuration;
        } else {
          timerDuration = duration;
          isStarting = false;
        }
      }
    }

    if (isStopping) {
      if (timerDuration < 1000) {
        // Desacelerar implica aumentar la duracion entre
        timerDuration = (timerDuration * 1.4).toInt();
      } else {
        timer.cancel();
        isRunningAnimation = false;
        isStopping = false;
      }
    }

    if (isRunningAnimation) {
      timer = Timer(Duration(milliseconds: timerDuration), runAnimation);
    }
  }

  stopAnimation() {
    if (!isStarting) {
      isStopping = true;
    }
  }

  handleTimeout() {
    setState(() {
      if (currentFrame < (keyFrames.length - 1)) {
        currentFrame++;
      } else {
        currentFrame = 0;
      }
    });
  }
}

// ignore: must_be_immutable
class Caja extends StatelessWidget {
  String text = '';
  Color color;
  late String id;
  late double width;
  late double height;
  late double y;
  late int duration;

  Caja(String key, {this.color = Colors.white}) : super(key: Key(key)) {
    id = key;
  }

  @override
  Widget build(BuildContext context) {
    final equipoProvider = Provider.of<EquipoProvider>(context);
    equipoProvider.setGeneroElejido(text);
    return AnimatedContainer(
      alignment: Alignment.center,
      duration: Duration(milliseconds: duration),
      width: width,
      height: height,
      margin: EdgeInsets.only(
        top: y,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(width: 1, color: mimodoTheme.primary),
        color: color,
      ),
      child: AnimatedDefaultTextStyle(
        style: TextStyle(
          color: mimodoTheme.primary,
          //color: Colors.transparent,
          fontSize: height / 3,
          fontFamily: mimodoTheme.fonts.title,
        ),
        duration: Duration(milliseconds: duration),
        child: Text(text),
      ),
    );
  }
}

class CardPosition {
  double percentWidth;
  double percentHeight;
  double percentY;

  CardPosition({
    required this.percentHeight,
    required this.percentWidth,
    required this.percentY,
  });
}
