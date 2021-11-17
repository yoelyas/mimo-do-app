# pictionaty_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Configuración

Crear archivo en `lib/const/config.dart`.

Ejemplo de `config.dart`
```dart
// import 'package:flutter/material.dart';

// ignore: constant_identifier_names
const Map<String, Map<String, dynamic>> APP_CONFIG = {
  "appBar": {
    "logo": "assets/logo_mimodo.png",
    "logo-gris": "assets/fondo_mimodo.png",
  },
  "drawer": {
    "avatar": "assets/500x300.png",
  },
  "gridBreakpoints": {
    "xs": 320.0, //*1
    "sm": 425.0,
    "md": 768.0, // *1.2
    "lg": 1024.0,
    "xl": 1200.0,
    //320
    // <= 425 es smallScreen
    // <= 768 es mediumScreen
    // <= 1200 es largeScreen
    // > 1200 es xLargeScreen
  },
};

int volumen = 0;

```