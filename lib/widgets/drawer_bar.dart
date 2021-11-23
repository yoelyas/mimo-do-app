import 'package:flutter/material.dart';
import 'package:pictionaty_app/const/config.dart';
import 'package:pictionaty_app/const/theme.dart';
import 'package:pictionaty_app/pages/home_page.dart';
import 'package:pictionaty_app/providers/equipo_provider.dart';
import 'package:pictionaty_app/providers/form_provider.dart';
import 'package:pictionaty_app/providers/movies_provider.dart';
import 'package:pictionaty_app/providers/state_provider.dart';
import 'package:pictionaty_app/providers/viewport_provider.dart';
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
    final viewportProvider = Provider.of<ViewportProvider>(context);
    String image = APP_CONFIG['drawer']!['avatar'];
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: viewportProvider.getCalcHeight(0.5),
        width: viewportProvider.getFullWidth() * 0.5,
        child: Drawer(
          child: Container(
            color: mimodoTheme.background,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: viewportProvider.getCalcHeight(0.045),
                ),
                Image(
                  fit: BoxFit.fill,
                  image: AssetImage(image),
                ),
                SizedBox(
                  height: viewportProvider.getCalcHeight(0.05),
                ),
                Container(
                  width: viewportProvider.getCalcWidth(0.4),
                  height: viewportProvider.getCalcHeight(0.08),
                  decoration: BoxDecoration(
                    color: mimodoTheme.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                    child: Text(
                      'Inicio',
                      style: TextStyle(
                        color: mimodoTheme.background,
                        fontSize: 26,
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
                /*Text(
                  'Volumen',
                  style: TextStyle(
                    color: mimodoTheme.primary,
                    fontSize: 20,
                    fontFamily: mimodoTheme.fonts.title,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      color: mimodoTheme.primary,
                      child: TextButton(
                        child: Icon(
                          Icons.add,
                          color: mimodoTheme.background,
                          size: 26,
                        ),
                        onPressed: () {
                          if (volumen < 10) {
                            setState(() {
                              volumen++;
                            });
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      child: Center(
                        child: Text(volumen.toString(),
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
                      color: mimodoTheme.primary,
                      child: TextButton(
                        child: Icon(
                          Icons.remove,
                          color: mimodoTheme.background,
                          size: 26,
                        ),
                        onPressed: () {
                          if (volumen > 0) {
                            setState(() {
                              volumen--;
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
