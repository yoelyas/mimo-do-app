import 'package:flutter/material.dart';
import 'package:pictionaty_app/const/config.dart';
import 'package:pictionaty_app/const/theme.dart';
import 'package:pictionaty_app/pages/config_equipos.dart';
import 'package:pictionaty_app/providers/equipo_provider.dart';
import 'package:provider/provider.dart';

//crea el boton de sucursal
class Bottom extends StatelessWidget {
  final String text;
  // ignore: use_key_in_widget_constructors
  const Bottom({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: TextButton(
        child: Row(
          children: [
            Image(
              fit: BoxFit.fill,
              image: AssetImage(APP_CONFIG['drawer']!['avatar']),
              height: 50,
              width: 70,
            ),
            const SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 270,
              height: 60,
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(text,
                              style: TextStyle(
                                color: mimodoTheme.primary,
                                fontSize: 12,
                                fontFamily: mimodoTheme.fonts.title,
                              )),
                          const SizedBox(
                            height: 8,
                          ),
                          Text("Subtexto algo largo para probar",
                              style: TextStyle(
                                color: mimodoTheme.primary,
                                fontSize: 12,
                                fontFamily: mimodoTheme.fonts.textBold,
                              )),
                        ],
                      ),
                      const Expanded(child: SizedBox()),
                      Icon(
                        Icons.chevron_right_sharp,
                        color: mimodoTheme.primary,
                        size: 40,
                      )
                    ],
                  ),
                  Container(
                    width: 300,
                    height: 1,
                    color: mimodoTheme.primary,
                  ),
                ],
              ),
            ),
          ],
        ),
        onPressed: () {
          Navigator.pushNamed(context, ConfigEquipos.routeName);
        },
      ),
    );
  }
}

class ButtomConfiEquipos extends StatefulWidget {
  const ButtomConfiEquipos({Key? key}) : super(key: key);

  @override
  State<ButtomConfiEquipos> createState() => _ButtomConfiEquiposState();
}

class _ButtomConfiEquiposState extends State<ButtomConfiEquipos> {
  @override
  Widget build(BuildContext context) {
    final equipoProvider = Provider.of<EquipoProvider>(context);
    int cantEquipos = equipoProvider.getCantEquipos();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Equipos",
            style: TextStyle(
              color: mimodoTheme.primary,
              fontSize: 15,
              fontFamily: mimodoTheme.fonts.title,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: mimodoTheme.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                child: Icon(
                  Icons.add,
                  color: mimodoTheme.background,
                  size: 26,
                ),
                onPressed: () {
                  if (equipoProvider.getCantEquipos() < 4) {
                    equipoProvider
                        .setCastEquipos(equipoProvider.getCantEquipos() + 1);
                  }
                },
              ),
            ),
            SizedBox(
              width: 90,
              child: Center(
                child: Text(cantEquipos.toString(),
                    style: TextStyle(
                      color: mimodoTheme.primary,
                      fontSize: 30,
                      fontFamily: mimodoTheme.fonts.textBold,
                    )),
              ),
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: mimodoTheme.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                child: Icon(
                  Icons.remove,
                  color: mimodoTheme.background,
                  size: 26,
                ),
                onPressed: () {
                  if (equipoProvider.getCantEquipos() > 2) {
                    equipoProvider
                        .setCastEquipos(equipoProvider.getCantEquipos() - 1);
                  }
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
