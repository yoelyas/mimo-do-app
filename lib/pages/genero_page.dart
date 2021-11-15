import 'package:flutter/material.dart';
import 'package:pictionaty_app/const/theme.dart';

import 'package:pictionaty_app/widgets/genero_button.dart';
import 'package:pictionaty_app/widgets/main_app_bar.dart';

class GenerosPage extends StatelessWidget {
  static const String routeName = 'genero';
  const GenerosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainAppBar = MimoAppbar();
    return Scaffold(
      appBar: mainAppBar.getWidget(context),
      body: Container(
        color: mimodoTheme.background,
        child: const Center(
          child: Padding(
            padding: EdgeInsets.only(top: 40, left: 20),
            child: Buttonsbody(),
          ),
        ),
      ),
    );
  }
}

class Buttonsbody extends StatelessWidget {
  const Buttonsbody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, IconData> generos = {
      "C/ficción": Icons.smart_toy_outlined,
      "Comedia": Icons.festival_rounded,
      "Drama": Icons.theater_comedy_outlined,
      "Aventura": Icons.hiking,
      "Terror": Icons.carpenter_rounded,
      "Acción": Icons.local_fire_department,
      "Fantasía": Icons.auto_fix_high,
      "Romance": Icons.favorite
    };
    List<Widget> buttoms = [];
    List<Widget> result = [];

    generos.forEach((key, value) {
      buttoms.add(Padding(
        padding: const EdgeInsets.all(4.0),
        child: GeneroButton(
          text: key,
          icon: value,
        ),
      ));
      if (buttoms.length >= 3) {
        result.add(Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            children: buttoms,
          ),
        ));
        buttoms = [];
      }
    });
    if (buttoms.isNotEmpty) {
      result.add(Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          children: buttoms,
        ),
      ));
    }

    return Column(
      children: [
        Column(
          children: result,
        ),
      ],
    );
  }
}
