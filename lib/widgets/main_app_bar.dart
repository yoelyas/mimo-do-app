import 'package:flutter/material.dart';
import 'package:pictionaty_app/const/config.dart';
import 'package:pictionaty_app/const/theme.dart';
import 'package:pictionaty_app/providers/viewport_provider.dart';
import 'package:provider/provider.dart';

class MimoAppbar {
  AppBar getWidget(BuildContext context) {
    final viewport = Provider.of<ViewportProvider>(context, listen: false);
    return AppBar(
      elevation: 20,
      toolbarHeight: viewport.setContext(context).getAppBarHeight(),
      centerTitle: true,
      title: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(APP_CONFIG['appBar']!['logo'],
            fit: BoxFit.contain,
            //el -10 es el margen que quiero que tenga mi logo
            height: 80)
      ]),
      backgroundColor: mimodoTheme.background,
      shadowColor: mimodoTheme.secondary,
      iconTheme: IconThemeData(
        color: mimodoTheme.primary,
      ),
    );
  }
}
