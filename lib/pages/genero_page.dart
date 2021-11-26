import 'package:flutter/material.dart';
import 'package:pictionaty_app/const/theme.dart';
import 'package:pictionaty_app/providers/viewport_provider.dart';
import 'package:pictionaty_app/widgets/drawer_bar.dart';

import 'package:pictionaty_app/widgets/genero_button.dart';
import 'package:pictionaty_app/widgets/main_app_bar.dart';
import 'package:provider/provider.dart';

class GenerosPage extends StatelessWidget {
  static const String routeName = 'genero';
  const GenerosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewport = Provider.of<ViewportProvider>(context);
    final mainAppBar = MimoAppbar();
    return Scaffold(
      appBar: mainAppBar.getWidget(context),
      drawer: SideBarMenu(
        context: context,
      ),
      body: Container(
        color: mimodoTheme.background,
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
                left: viewport.getCalcWidth(0.04),
                right: viewport.getCalcWidth(0.04)),
            child: Buttonsbody(
              viewport: viewport,
            ),
          ),
        ),
      ),
    );
  }
}

class Buttonsbody extends StatelessWidget {
  final ViewportProvider viewport;
  // ignore: use_key_in_widget_constructors
  const Buttonsbody({required this.viewport});

  @override
  Widget build(BuildContext context) {
    Map<String, IconData> generos = {
      "Acción": Icons.local_fire_department,
      "Aventura": Icons.hiking,
      "Comedia": Icons.festival_rounded,
      "Drama": Icons.theater_comedy_outlined,
      "Fantasía": Icons.auto_fix_high,
      "Terror": Icons.carpenter_rounded,
      "Romance": Icons.favorite,
      "C. ficción": Icons.smart_toy_outlined,
    };
    List<Widget> buttoms = [];
    List<Widget> result = [];

    generos.forEach((key, value) {
      buttoms.add(Padding(
        padding: EdgeInsets.only(
            left: viewport.getCalcWidth(0.025),
            right: viewport.getCalcWidth(0.08),
            bottom: viewport.getCalcHeight(0.05)),
        child: GeneroButton(
          text: key,
          icon: value,
        ),
      ));
      if (buttoms.length >= 3) {
        result.add(Padding(
          padding: EdgeInsets.only(
            top: viewport.getCalcHeight(0.05),
          ),
          child: Row(
            children: buttoms,
          ),
        ));
        buttoms = [];
      }
    });
    if (buttoms.isNotEmpty) {
      result.add(Padding(
        padding: EdgeInsets.only(
          top: viewport.getCalcHeight(0.05),
        ),
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
