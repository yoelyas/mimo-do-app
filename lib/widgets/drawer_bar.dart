import 'package:flutter/material.dart';
import 'package:mimo_do/const/config.dart';
import 'package:mimo_do/const/theme.dart';
import 'package:mimo_do/pages/home_page.dart';
import 'package:mimo_do/providers/equipo_provider.dart';
import 'package:mimo_do/providers/form_provider.dart';
import 'package:mimo_do/providers/movies_provider.dart';
import 'package:mimo_do/providers/state_provider.dart';
import 'package:mimo_do/providers/viewport_provider.dart';
import 'package:provider/provider.dart';

//menu del costado

class SideBarMenu extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  SideBarMenu({required this.context});

  final BuildContext context;

  @override
  State<SideBarMenu> createState() => _SideBarMenuState();
}

class _SideBarMenuState extends State<SideBarMenu> {
  @override
  Widget build(BuildContext context) {
    final loginFormProvider = Provider.of<LoginFormProvider>(context);
    final moviesProvider = Provider.of<MoviesProvider>(context);
    final stateProvider = Provider.of<StateProvider>(context);
    final equipoProvider = Provider.of<EquipoProvider>(context);
    final viewport = Provider.of<ViewportProvider>(context);
    String image = APP_CONFIG['appBar']!['logo'];
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: viewport.getCalcHeight(0.5),
        width: viewport.getFullWidth() * 0.5,
        child: Drawer(
          child: Container(
            color: mimodoTheme.background,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: viewport.getCalcHeight(0.045),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  height: viewport.getCalcHeight(0.08),
                  width: viewport.getFullWidth() * 0.4,
                  child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage(image),
                  ),
                ),
                SizedBox(
                  height: viewport.getCalcHeight(0.05),
                ),
                Container(
                  width: viewport.getCalcWidth(0.4),
                  height: viewport.getCalcHeight(0.08),
                  decoration: BoxDecoration(
                    color: mimodoTheme.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                    child: Text(
                      'Inicio',
                      style: TextStyle(
                        color: mimodoTheme.background,
                        fontSize: viewport.getCalcHeight(0.04),
                      ),
                    ),
                    onPressed: () {
                      loginFormProvider.reset();
                      moviesProvider.reset();
                      stateProvider.reset();
                      equipoProvider.reset();
                      Navigator.pushNamed(context, HomePage.routeName);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
