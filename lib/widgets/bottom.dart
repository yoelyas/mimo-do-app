import 'package:flutter/material.dart';
import 'package:mimo_do/const/theme.dart';
import 'package:mimo_do/pages/config_equipos.dart';
import 'package:mimo_do/providers/equipo_provider.dart';
import 'package:mimo_do/providers/viewport_provider.dart';
import 'package:provider/provider.dart';

//crea el boton de sucursal
class Bottom extends StatelessWidget {
  final String text;
  final String subtexto;
  final String imagen;
  // ignore: use_key_in_widget_constructors
  const Bottom({
    required this.text,
    required this.subtexto,
    required this.imagen,
  });

  @override
  Widget build(BuildContext context) {
    final viewport = Provider.of<ViewportProvider>(context);

    final equipoProvider = Provider.of<EquipoProvider>(context);
    return SizedBox(
      width: double.infinity,
      //height: viewport.getCalcHeight(0.2),
      child: TextButton(
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: mimodoTheme.primary),
              ),
              child: Image(
                fit: BoxFit.fill,
                image: AssetImage(imagen),
                height: viewport.getCalcHeight(0.1),
                width: viewport.getCalcWidth(0.18),
              ),
            ),
            Expanded(child: Container()),
            SizedBox(
              height: viewport.getCalcHeight(0.1),
              width: viewport.getCalcWidth(0.7),
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
                                fontSize: viewport.getCalcHeight(0.04),
                                fontFamily: mimodoTheme.fonts.title,
                              )),
                          SizedBox(
                            height: viewport.getCalcHeight(0.005),
                          ),
                          Text(subtexto,
                              style: TextStyle(
                                color: mimodoTheme.primary,
                                fontSize: viewport.getCalcHeight(0.022),
                                fontFamily: mimodoTheme.fonts.textBold,
                              )),
                        ],
                      ),
                      const Expanded(child: SizedBox()),
                      Icon(
                        Icons.chevron_right_sharp,
                        color: mimodoTheme.primary,
                        size: viewport.getCalcHeight(0.05),
                      )
                    ],
                  ),
                  Container(
                    width: viewport.getCalcWidth(0.7),
                    height: 1,
                    color: mimodoTheme.primary,
                  ),
                ],
              ),
            ),
          ],
        ),
        onPressed: () {
          equipoProvider.setModoElejido(text);
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
    final viewport = Provider.of<ViewportProvider>(context);
    final equipoProvider = Provider.of<EquipoProvider>(context);
    int cantEquipos = equipoProvider.getCantEquipos();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(
            viewport.getCalcHeight(0.02),
          ),
          child: Text(
            "Equipos",
            style: TextStyle(
              color: mimodoTheme.primary,
              fontSize: viewport.getCalcHeight(0.04),
              fontFamily: mimodoTheme.fonts.title,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: viewport.getCalcWidth(0.11),
              height: viewport.getCalcHeight(0.08),
              decoration: BoxDecoration(
                color: mimodoTheme.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                child: Icon(
                  Icons.add,
                  color: mimodoTheme.background,
                  size: viewport.getCalcHeight(0.05),
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
              width: viewport.getCalcWidth(0.2),
              child: Center(
                child: Text(cantEquipos.toString(),
                    style: TextStyle(
                      color: mimodoTheme.primary,
                      fontSize: viewport.getCalcHeight(0.06),
                      fontFamily: mimodoTheme.fonts.textBold,
                    )),
              ),
            ),
            Container(
              width: viewport.getCalcWidth(0.11),
              height: viewport.getCalcHeight(0.08),
              decoration: BoxDecoration(
                color: mimodoTheme.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                child: Icon(
                  Icons.remove,
                  color: mimodoTheme.background,
                  size: viewport.getCalcHeight(0.05),
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
