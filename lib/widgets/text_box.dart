import 'package:flutter/material.dart';
import 'package:pictionaty_app/const/theme.dart';
import 'package:pictionaty_app/providers/equipo_provider.dart';
import 'package:pictionaty_app/providers/form_provider.dart';
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
    return TextFormField(
      key: Key(equipo.toString()),
      autocorrect: false,
      textCapitalization: TextCapitalization.sentences,
      style: TextStyle(color: mimodoTheme.primary, fontSize: 20.0),
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
    final loginForm = Provider.of<LoginFormProvider>(context);
    final equipoProvider = Provider.of<EquipoProvider>(context);
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
        const SizedBox(
          height: 20,
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
