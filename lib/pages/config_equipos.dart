import 'package:flutter/material.dart';
import 'package:pictionaty_app/const/theme.dart';
import 'package:pictionaty_app/pages/config_juego.dart';
import 'package:pictionaty_app/pages/tabla_pociciones_page.dart';
import 'package:pictionaty_app/providers/equipo_provider.dart';
import 'package:pictionaty_app/providers/form_provider.dart';
import 'package:pictionaty_app/providers/viewport_provider.dart';
import 'package:pictionaty_app/widgets/bottom.dart';
import 'package:pictionaty_app/widgets/drawer_bar.dart';
import 'package:pictionaty_app/widgets/text_box.dart';
import 'package:pictionaty_app/widgets/main_app_bar.dart';
import 'package:provider/provider.dart';

class ConfigEquipos extends StatefulWidget {
  static const String routeName = 'equipos';
  const ConfigEquipos({Key? key}) : super(key: key);

  @override
  State<ConfigEquipos> createState() => _ConfigEquiposState();
}

class _ConfigEquiposState extends State<ConfigEquipos> {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    final equipoProvider = Provider.of<EquipoProvider>(context);
    final viewport = Provider.of<ViewportProvider>(context);
    final mainAppBar = MimoAppbar();
    return Scaffold(
        appBar: mainAppBar.getWidget(context),
        drawer: SideBarMenu(
          context: context,
        ),
        body: Container(
          color: mimodoTheme.background,
          child: ListView(children: [
            Padding(
              padding: EdgeInsets.only(
                  top: viewport.getCalcHeight(0.05),
                  left: viewport.getCalcWidth(0.04),
                  right: viewport.getCalcWidth(0.04)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: viewport.getCalcHeight(0.01)),
                    child: Text(
                      "Selección de equipos",
                      style: TextStyle(
                        color: mimodoTheme.primary,
                        fontSize: viewport.getCalcHeight(0.03),
                        fontFamily: mimodoTheme.fonts.title,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: mimodoTheme.secondary,
                  ),
                  SizedBox(
                    height: viewport.getCalcHeight(0.02),
                  ),
                  const ButtomConfiEquipos(),
                  SizedBox(
                    height: viewport.getCalcHeight(0.04),
                  ),
                  const Equipos(),
                  SizedBox(
                    height: viewport.getCalcHeight(0.02),
                  ),
                  Container(
                    width: double.infinity,
                    height: viewport.getCalcHeight(0.1),
                    decoration: BoxDecoration(
                      color: mimodoTheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      child: Text(
                        "Listo",
                        style: TextStyle(
                          color: mimodoTheme.background,
                          fontSize: viewport.getCalcHeight(0.05),
                          fontFamily: mimodoTheme.fonts.title,
                        ),
                      ),
                      onPressed: () {
                        //loginForm.isValidForm();
                        equipoProvider.initialize(loginForm.getNombreEquipos());
                        Navigator.pushNamed(context, ConfigJuegoPage.routeName);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ]),
        ));
  }
}
