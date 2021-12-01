import 'package:flutter/material.dart';
import 'package:mimo_do/pages/cartelera_page.dart';
import 'package:mimo_do/pages/config_equipos.dart';
import 'package:mimo_do/pages/config_juego.dart';
import 'package:mimo_do/pages/genero_page.dart';
import 'package:mimo_do/pages/home_page.dart';
import 'package:mimo_do/pages/pelicula_page.dart';
import 'package:mimo_do/pages/pregunta_pages.dart';
import 'package:mimo_do/pages/ruleta_generos.dart';
import 'package:mimo_do/pages/tabla_posiciones_page.dart';
import 'package:mimo_do/providers/equipo_provider.dart';
import 'package:mimo_do/providers/movies_provider.dart';
import 'package:mimo_do/providers/viewport_provider.dart';
import 'package:provider/provider.dart';

import 'providers/form_provider.dart';
import 'providers/state_provider.dart';

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
        ChangeNotifierProvider(
          create: (_) => StateProvider(),
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
        'cartelera': (_) => const CarteleraPage(),
      },
    );
  }
}
