import 'package:flutter/material.dart';
import 'package:pictionaty_app/const/theme.dart';
import 'package:pictionaty_app/pages/config_juego.dart';
import 'package:pictionaty_app/providers/equipo_provider.dart';
import 'package:pictionaty_app/providers/form_provider.dart';
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
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 10),
                    child: Text(
                      "Selección de equipos",
                      style: TextStyle(
                        color: mimodoTheme.primary,
                        fontSize: 15,
                        fontFamily: mimodoTheme.fonts.title,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: mimodoTheme.secondary,
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  const ButtomConfiEquipos(),
                  const SizedBox(
                    height: 35,
                  ),
                  const Equipos(),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
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
                        //loginForm.isValidForm();
                        equipoProvider.initialize(loginForm.getNombreEquipos());
                        Navigator.pushNamed(context, ConfigJuegoPage.routeName);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}
