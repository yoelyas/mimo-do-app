import 'dart:ui' show Color;
import 'package:flutter/cupertino.dart';
import 'package:pictionaty_app/libraries/app_theme.dart';

final mimodoTheme = AppTheme(
    primary: const Color.fromRGBO(253, 30, 110, 1),
    secondary: const Color.fromRGBO(114, 46, 95, 1),
    third: const Color.fromRGBO(15, 35, 70, 1),
    background: const Color.fromRGBO(15, 35, 70, 1),
    fonts: AppFonts(
      title: 'gotham-regular',
      display: 'gotham-bold',
      text: 'lato-regular',
      textBold: 'lato-bold',
    ));
