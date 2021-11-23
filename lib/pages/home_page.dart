import 'package:flutter/material.dart';
import 'package:pictionaty_app/const/theme.dart';
import 'package:pictionaty_app/widgets/bottom.dart';
import 'package:pictionaty_app/widgets/drawer_bar.dart';
import 'package:pictionaty_app/widgets/main_app_bar.dart';

class HomePage extends StatelessWidget {
  static const String routeName = 'home';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainAppBar = MimoAppbar();
    return Scaffold(
      appBar: mainAppBar.getWidget(context),
      drawer: SideBarMenu(
        context: context,
      ),
      body: Container(
        color: mimodoTheme.background,
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 12),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text("Elegí un modo de juego ",
                        style: TextStyle(
                          color: mimodoTheme.primary,
                          fontSize: 15,
                          fontFamily: mimodoTheme.fonts.textBold,
                        )),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: mimodoTheme.secondary,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Bottom(
              text: "Ruleta",
              imagen: 'assets/ruleta.gif',
              subtexto: 'Deja al azar el genero de la pelicula',
            ),
            const SizedBox(
              height: 30,
            ),
            const Bottom(
              text: "Genero",
              imagen: 'assets/genero.png',
              subtexto: 'Selecciona el gereno de la peli que quieras',
            ),
            const SizedBox(
              height: 30,
            ),
            const Bottom(
              text: "En cartelera",
              imagen: 'assets/pelicula.png',
              subtexto: 'Juega con pelis solo en cine',
            ),
          ],
        ),
      ),
    );
  }
}
