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
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text("Elegí un modo de juego ",
                    style: TextStyle(
                      color: mimodoTheme.primary,
                      fontSize: 15,
                      fontFamily: mimodoTheme.fonts.textBold,
                    )),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Bottom(
              text: "Ruleta",
            ),
            const SizedBox(
              height: 30,
            ),
            const Bottom(
              text: "En cartelera",
            ),
            const SizedBox(
              height: 30,
            ),
            const Bottom(
              text: "Configuracion",
            ),
          ],
        ),
      ),
    );
  }
}
