import 'package:flutter/material.dart';
import 'package:pictionaty_app/const/theme.dart';
import 'package:pictionaty_app/providers/equipo_provider.dart';
import 'package:pictionaty_app/providers/viewport_provider.dart';
import 'package:provider/provider.dart';

class Tablero extends StatelessWidget {
  const Tablero({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final equipoProvider = Provider.of<EquipoProvider>(context);
    switch (equipoProvider.getCantEquipos()) {
      case 2:
        {
          return dosEquipos(context, equipoProvider);
        }

      case 3:
        {
          return tresEquipos(context, equipoProvider);
        }

      default:
        {
          return cuatroEquipos(context, equipoProvider);
        }
    }
  }

  Column cuatroEquipos(BuildContext context, EquipoProvider equipoProvider) {
    final viewport = Provider.of<ViewportProvider>(context);
    return Column(
      children: [
        Row(
          children: [
            Container(
                width: viewport.getCalcWidth(0.44),
                height: viewport.getCalcHeight(0.3),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: mimodoTheme.primary),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: viewport.getCalcHeight(0.13),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: viewport.getCalcHeight(0.03),
                          bottom: viewport.getCalcHeight(0.01),
                          left: viewport.getCalcWidth(0.03),
                        ),
                        child: Text(
                          equipoProvider.traermeEquipo(0),
                          style: TextStyle(
                            color: mimodoTheme.primary,
                            fontSize: viewport.getCalcHeight(0.03),
                            fontFamily: mimodoTheme.fonts.title,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: viewport.getCalcHeight(0.15),
                      child: Center(
                        child: Text(
                          equipoProvider
                              .traermePuntuacionEquipo(
                                equipoProvider.traermeEquipo(0),
                              )
                              .toString(),
                          style: TextStyle(
                            color: mimodoTheme.primary,
                            fontSize: viewport.getCalcHeight(0.1),
                            fontFamily: mimodoTheme.fonts.text,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            Container(
                width: viewport.getCalcWidth(0.44),
                height: viewport.getCalcHeight(0.3),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: mimodoTheme.primary),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: viewport.getCalcHeight(0.13),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: viewport.getCalcHeight(0.03),
                          bottom: viewport.getCalcHeight(0.01),
                          left: viewport.getCalcWidth(0.03),
                        ),
                        child: Text(
                          equipoProvider.traermeEquipo(1),
                          style: TextStyle(
                            color: mimodoTheme.primary,
                            fontSize: viewport.getCalcHeight(0.03),
                            fontFamily: mimodoTheme.fonts.title,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: viewport.getCalcHeight(0.15),
                      child: Center(
                        child: Text(
                          equipoProvider
                              .traermePuntuacionEquipo(
                                equipoProvider.traermeEquipo(1),
                              )
                              .toString(),
                          style: TextStyle(
                            color: mimodoTheme.primary,
                            fontSize: viewport.getCalcHeight(0.1),
                            fontFamily: mimodoTheme.fonts.text,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
        Row(
          children: [
            Container(
                width: viewport.getCalcWidth(0.44),
                height: viewport.getCalcHeight(0.3),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: mimodoTheme.primary),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: viewport.getCalcHeight(0.13),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: viewport.getCalcHeight(0.03),
                          bottom: viewport.getCalcHeight(0.01),
                          left: viewport.getCalcWidth(0.03),
                        ),
                        child: Text(
                          equipoProvider.traermeEquipo(2),
                          style: TextStyle(
                            color: mimodoTheme.primary,
                            fontSize: viewport.getCalcHeight(0.03),
                            fontFamily: mimodoTheme.fonts.title,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: viewport.getCalcHeight(0.15),
                      child: Center(
                        child: Text(
                          equipoProvider
                              .traermePuntuacionEquipo(
                                equipoProvider.traermeEquipo(2),
                              )
                              .toString(),
                          style: TextStyle(
                            color: mimodoTheme.primary,
                            fontSize: viewport.getCalcHeight(0.1),
                            fontFamily: mimodoTheme.fonts.text,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            Container(
                width: viewport.getCalcWidth(0.44),
                height: viewport.getCalcHeight(0.3),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: mimodoTheme.primary),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: viewport.getCalcHeight(0.13),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: viewport.getCalcHeight(0.03),
                          bottom: viewport.getCalcHeight(0.01),
                          left: viewport.getCalcWidth(0.03),
                        ),
                        child: Text(
                          equipoProvider.traermeEquipo(3),
                          style: TextStyle(
                            color: mimodoTheme.primary,
                            fontSize: viewport.getCalcHeight(0.03),
                            fontFamily: mimodoTheme.fonts.title,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: viewport.getCalcHeight(0.15),
                      child: Center(
                        child: Text(
                          equipoProvider
                              .traermePuntuacionEquipo(
                                equipoProvider.traermeEquipo(3),
                              )
                              .toString(),
                          style: TextStyle(
                            color: mimodoTheme.primary,
                            fontSize: viewport.getCalcHeight(0.1),
                            fontFamily: mimodoTheme.fonts.text,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ],
    );
  }

  Column tresEquipos(BuildContext context, EquipoProvider equipoProvider) {
    final viewport = Provider.of<ViewportProvider>(context);
    return Column(
      children: [
        Row(
          children: [
            Container(
                width: viewport.getCalcWidth(0.44),
                height: viewport.getCalcHeight(0.3),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: mimodoTheme.primary),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: viewport.getCalcHeight(0.13),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: viewport.getCalcHeight(0.03),
                          bottom: viewport.getCalcHeight(0.01),
                          left: viewport.getCalcWidth(0.03),
                        ),
                        child: Text(
                          equipoProvider.traermeEquipo(0),
                          style: TextStyle(
                            color: mimodoTheme.primary,
                            fontSize: viewport.getCalcHeight(0.03),
                            fontFamily: mimodoTheme.fonts.title,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: viewport.getCalcHeight(0.15),
                      child: Center(
                        child: Text(
                          equipoProvider
                              .traermePuntuacionEquipo(
                                equipoProvider.traermeEquipo(0),
                              )
                              .toString(),
                          style: TextStyle(
                            color: mimodoTheme.primary,
                            fontSize: viewport.getCalcHeight(0.1),
                            fontFamily: mimodoTheme.fonts.text,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            Container(
                width: viewport.getCalcWidth(0.44),
                height: viewport.getCalcHeight(0.3),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: mimodoTheme.primary),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: viewport.getCalcHeight(0.13),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: viewport.getCalcHeight(0.03),
                          bottom: viewport.getCalcHeight(0.01),
                          left: viewport.getCalcWidth(0.03),
                        ),
                        child: Text(
                          equipoProvider.traermeEquipo(1),
                          style: TextStyle(
                            color: mimodoTheme.primary,
                            fontSize: viewport.getCalcHeight(0.03),
                            fontFamily: mimodoTheme.fonts.title,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: viewport.getCalcHeight(0.15),
                      child: Center(
                        child: Text(
                          equipoProvider
                              .traermePuntuacionEquipo(
                                equipoProvider.traermeEquipo(1),
                              )
                              .toString(),
                          style: TextStyle(
                            color: mimodoTheme.primary,
                            fontSize: viewport.getCalcHeight(0.1),
                            fontFamily: mimodoTheme.fonts.text,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
        Container(
            width: viewport.getCalcWidth(0.88),
            height: viewport.getCalcHeight(0.3),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: mimodoTheme.primary),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: viewport.getCalcHeight(0.03),
                    bottom: viewport.getCalcHeight(0.01),
                  ),
                  child: Text(
                    equipoProvider.traermeEquipo(2),
                    style: TextStyle(
                      color: mimodoTheme.primary,
                      fontSize: viewport.getCalcHeight(0.03),
                      fontFamily: mimodoTheme.fonts.title,
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: viewport.getCalcHeight(0.15),
                  child: Center(
                    child: Text(
                      equipoProvider
                          .traermePuntuacionEquipo(
                            equipoProvider.traermeEquipo(2),
                          )
                          .toString(),
                      style: TextStyle(
                        color: mimodoTheme.primary,
                        fontSize: viewport.getCalcHeight(0.1),
                        fontFamily: mimodoTheme.fonts.text,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }

  Column dosEquipos(BuildContext context, EquipoProvider equipoProvider) {
    final viewport = Provider.of<ViewportProvider>(context);
    return Column(
      children: [
        Row(
          children: [
            Container(
                width: viewport.getCalcWidth(0.44),
                height: viewport.getCalcHeight(0.6),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: mimodoTheme.primary),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: viewport.getCalcHeight(0.2),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: viewport.getCalcHeight(0.03),
                          bottom: viewport.getCalcHeight(0.01),
                          left: viewport.getCalcWidth(0.03),
                        ),
                        child: Text(
                          equipoProvider.traermeEquipo(0),
                          style: TextStyle(
                            color: mimodoTheme.primary,
                            fontSize: viewport.getCalcHeight(0.03),
                            fontFamily: mimodoTheme.fonts.title,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: viewport.getCalcHeight(0.2),
                      child: Center(
                        child: Text(
                          equipoProvider
                              .traermePuntuacionEquipo(
                                equipoProvider.traermeEquipo(0),
                              )
                              .toString(),
                          style: TextStyle(
                            color: mimodoTheme.primary,
                            fontSize: viewport.getCalcHeight(0.1),
                            fontFamily: mimodoTheme.fonts.text,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            Container(
                width: viewport.getCalcWidth(0.44),
                height: viewport.getCalcHeight(0.6),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: mimodoTheme.primary),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: viewport.getCalcHeight(0.2),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: viewport.getCalcHeight(0.03),
                          bottom: viewport.getCalcHeight(0.01),
                          left: viewport.getCalcWidth(0.03),
                        ),
                        child: Text(
                          equipoProvider.traermeEquipo(1),
                          style: TextStyle(
                            color: mimodoTheme.primary,
                            fontSize: viewport.getCalcHeight(0.03),
                            fontFamily: mimodoTheme.fonts.title,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: viewport.getCalcHeight(0.2),
                      child: Center(
                        child: Text(
                          equipoProvider
                              .traermePuntuacionEquipo(
                                equipoProvider.traermeEquipo(1),
                              )
                              .toString(),
                          style: TextStyle(
                            color: mimodoTheme.primary,
                            fontSize: viewport.getCalcHeight(0.1),
                            fontFamily: mimodoTheme.fonts.text,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ],
    );
  }
}
