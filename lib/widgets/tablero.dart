import 'package:flutter/material.dart';
import 'package:pictionaty_app/const/theme.dart';
import 'package:pictionaty_app/providers/equipo_provider.dart';
import 'package:provider/provider.dart';

class Tablero extends StatelessWidget {
  const Tablero({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final equipoProvider = Provider.of<EquipoProvider>(context);
    switch (equipoProvider.getCantEquipos()) {
      case 2:
        {
          return dosEquipos(equipoProvider);
        }

      case 3:
        {
          return tresEquipos(equipoProvider);
        }

      default:
        {
          return cuatroEquipos(equipoProvider);
        }
    }
  }

  Column cuatroEquipos(EquipoProvider equipoProvider) {
    return Column(
      children: [
        Row(
          children: [
            Container(
                width: 175,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          equipoProvider.traermeEquipo(1),
                          style: TextStyle(
                            color: mimodoTheme.primary,
                            fontSize: 15,
                            fontFamily: mimodoTheme.fonts.title,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      height: 80,
                      child: Center(
                        child: Text(
                          equipoProvider.traermePuntuacionEquipo(1).toString(),
                          style: TextStyle(
                            color: mimodoTheme.primary,
                            fontSize: 30,
                            fontFamily: mimodoTheme.fonts.text,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            Container(
                width: 175,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          equipoProvider.traermeEquipo(2),
                          style: TextStyle(
                            color: mimodoTheme.primary,
                            fontSize: 15,
                            fontFamily: mimodoTheme.fonts.title,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      height: 80,
                      child: Center(
                        child: Text(
                          equipoProvider.traermePuntuacionEquipo(1).toString(),
                          style: TextStyle(
                            color: mimodoTheme.primary,
                            fontSize: 30,
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
                width: 175,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          equipoProvider.traermeEquipo(3),
                          style: TextStyle(
                            color: mimodoTheme.primary,
                            fontSize: 15,
                            fontFamily: mimodoTheme.fonts.title,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      height: 80,
                      child: Center(
                        child: Text(
                          equipoProvider.traermePuntuacionEquipo(1).toString(),
                          style: TextStyle(
                            color: mimodoTheme.primary,
                            fontSize: 30,
                            fontFamily: mimodoTheme.fonts.text,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            Container(
                width: 175,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          equipoProvider.traermeEquipo(4),
                          style: TextStyle(
                            color: mimodoTheme.primary,
                            fontSize: 15,
                            fontFamily: mimodoTheme.fonts.title,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      height: 80,
                      child: Center(
                        child: Text(
                          equipoProvider.traermePuntuacionEquipo(1).toString(),
                          style: TextStyle(
                            color: mimodoTheme.primary,
                            fontSize: 30,
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

  Column tresEquipos(EquipoProvider equipoProvider) {
    return Column(
      children: [
        Row(
          children: [
            Container(
                width: 175,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          equipoProvider.traermeEquipo(1),
                          style: TextStyle(
                            color: mimodoTheme.primary,
                            fontSize: 15,
                            fontFamily: mimodoTheme.fonts.title,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      height: 80,
                      child: Center(
                        child: Text(
                          equipoProvider.traermePuntuacionEquipo(1).toString(),
                          style: TextStyle(
                            color: mimodoTheme.primary,
                            fontSize: 30,
                            fontFamily: mimodoTheme.fonts.text,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            Container(
                width: 175,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          equipoProvider.traermeEquipo(2),
                          style: TextStyle(
                            color: mimodoTheme.primary,
                            fontSize: 15,
                            fontFamily: mimodoTheme.fonts.title,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      height: 80,
                      child: Center(
                        child: Text(
                          equipoProvider.traermePuntuacionEquipo(1).toString(),
                          style: TextStyle(
                            color: mimodoTheme.primary,
                            fontSize: 30,
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
            width: 350,
            height: 150,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    equipoProvider.traermeEquipo(3),
                    style: TextStyle(
                      color: mimodoTheme.primary,
                      fontSize: 15,
                      fontFamily: mimodoTheme.fonts.title,
                    ),
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 80,
                  child: Center(
                    child: Text(
                      equipoProvider.traermePuntuacionEquipo(1).toString(),
                      style: TextStyle(
                        color: mimodoTheme.primary,
                        fontSize: 30,
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

  Column dosEquipos(EquipoProvider equipoProvider) {
    return Column(
      children: [
        Row(
          children: [
            Container(
                width: 175,
                height: 300,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          equipoProvider.traermeEquipo(1),
                          style: TextStyle(
                            color: mimodoTheme.primary,
                            fontSize: 30,
                            fontFamily: mimodoTheme.fonts.title,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      height: 244,
                      child: Center(
                        child: Text(
                          equipoProvider.traermePuntuacionEquipo(1).toString(),
                          style: TextStyle(
                            color: mimodoTheme.primary,
                            fontSize: 45,
                            fontFamily: mimodoTheme.fonts.text,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            Container(
                width: 175,
                height: 300,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          equipoProvider.traermeEquipo(1),
                          style: TextStyle(
                            color: mimodoTheme.primary,
                            fontSize: 30,
                            fontFamily: mimodoTheme.fonts.title,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      height: 244,
                      child: Center(
                        child: Text(
                          equipoProvider.traermePuntuacionEquipo(1).toString(),
                          style: TextStyle(
                            color: mimodoTheme.primary,
                            fontSize: 45,
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
