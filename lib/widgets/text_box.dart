import 'package:flutter/material.dart';
import 'package:mimo_do/const/theme.dart';
import 'package:mimo_do/providers/equipo_provider.dart';
import 'package:mimo_do/providers/form_provider.dart';
import 'package:mimo_do/providers/viewport_provider.dart';
import 'package:provider/provider.dart';

class TextBox extends StatelessWidget {
  const TextBox({
    Key? key,
    required this.textStyle,
    required this.equipo,
  }) : super(key: key);

  final TextStyle textStyle;
  final int equipo;

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    final viewport = Provider.of<ViewportProvider>(context);
    return TextFormField(
      key: Key(equipo.toString()),
      autocorrect: false,
      textCapitalization: TextCapitalization.sentences,
      style: TextStyle(
        color: mimodoTheme.primary,
        fontSize: viewport.getCalcHeight(0.04),
      ),
      decoration: inputDecorations(),
      initialValue: 'Equipo $equipo',
      onChanged: (value) {
        RegExp regExp = RegExp(r'^[\w ]+$');
        if (value != null &&
            value.trim().length < 21 &&
            value.trim().isNotEmpty &&
            regExp.hasMatch(value)) {
          loginForm.setNombreEquipo(equipo, value);
        }
      },
      validator: (value) {
        RegExp regExp = RegExp(r'^[\w ]+$');
        if (value != null &&
            value.trim().length < 21 &&
            value.trim().isNotEmpty &&
            regExp.hasMatch(value)) return null;

        return 'El nombre ingresado no es válido';
      },
    );
  }

  InputDecoration inputDecorations() {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: mimodoTheme.primary, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: mimodoTheme.secondary, width: 1),
      ),
      hintText: 'Nombre del equipo',
      hintStyle: textStyle,
      labelText: 'Equipo $equipo',
      labelStyle: textStyle,
    );
  }
}

class Equipos extends StatelessWidget {
  const Equipos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final equipoProvider = Provider.of<EquipoProvider>(context);
    final viewport = Provider.of<ViewportProvider>(context);
    int cantEquipos = equipoProvider.getCantEquipos();
    List<Widget> equipos = [];

    for (var i = 0; i < cantEquipos; i++) {
      int cont = i + 1;
      equipos.add(TextBox(
          textStyle: TextStyle(
            color: mimodoTheme.primary,
          ),
          equipo: cont));
      equipos.add(
        SizedBox(
          height: viewport.getCalcHeight(0.03),
        ),
      );
    }

    return Form(
      //key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: equipos,
      ),
      //onChanged: ,
    );
  }
}
