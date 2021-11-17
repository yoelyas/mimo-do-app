import 'package:flutter/material.dart';
import 'package:pictionaty_app/pages/config_equipos.dart';
import 'package:pictionaty_app/pages/config_juego.dart';
import 'package:pictionaty_app/pages/genero_page.dart';
import 'package:pictionaty_app/pages/home_page.dart';
import 'package:pictionaty_app/pages/pelicula_page.dart';
import 'package:pictionaty_app/pages/pregunta_pages.dart';
import 'package:pictionaty_app/pages/ruleta_generos.dart';
import 'package:pictionaty_app/pages/tabla_pociciones_page.dart';
import 'package:pictionaty_app/providers/equipo_provider.dart';
import 'package:pictionaty_app/providers/movies_provider.dart';
import 'package:pictionaty_app/providers/viewport_provider.dart';
import 'package:provider/provider.dart';

import 'providers/form_provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => EquipoProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => LoginFormProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ViewportProvider(
            context: context,
            appBarHeight: 0.1,
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy: false,
        ),
      ],
      child: const MimodoApp(),
    );
  }
}

class MimodoApp extends StatelessWidget {
  const MimodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mimo-do App',
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomePage(),
        'genero': (_) => const GenerosPage(),
        'equipos': (_) => const ConfigEquipos(),
        'juego': (_) => const ConfigJuegoPage(),
        'tablon': (_) => const TablaPosicionesPage(),
        'ruleta': (_) => const RuletaDeGeneros(),
        'pelicula': (_) => const PeliculaPage(),
        'pregunta': (_) => const PreguntaPage(),
      },
    );
  }
}
