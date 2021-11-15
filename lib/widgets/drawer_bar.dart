import 'package:flutter/material.dart';
import 'package:pictionaty_app/const/config.dart';
import 'package:pictionaty_app/const/theme.dart';

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
    String image = APP_CONFIG['appBar']!['logo-gris'];
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: 300,
        width: MediaQuery.of(context).size.width * 0.5,
        child: Drawer(
          child: Container(
            color: mimodoTheme.background,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                Image(
                  fit: BoxFit.fill,
                  image: AssetImage(image),
                ),
                const SizedBox(
                  height: 35,
                ),
                Text(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
