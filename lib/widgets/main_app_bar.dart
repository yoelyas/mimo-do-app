import 'package:flutter/material.dart';
import 'package:mimo_do/const/config.dart';
import 'package:mimo_do/const/theme.dart';
import 'package:mimo_do/providers/viewport_provider.dart';
import 'package:provider/provider.dart';

class MimoAppbar {
  AppBar getWidget(BuildContext context) {
    final viewport = Provider.of<ViewportProvider>(context, listen: false);
    return AppBar(
      elevation: 10,
      toolbarHeight: viewport.setContext(context).getAppBarHeight(),
      centerTitle: true,
      title: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(APP_CONFIG['appBar']!['logo'],
            fit: BoxFit.contain,
            //el -10 es el margen que quiero que tenga mi logo
            height: 35)
      ]),
      backgroundColor: mimodoTheme.background,
      shadowColor: mimodoTheme.primary,
      iconTheme: IconThemeData(
        color: mimodoTheme.primary,
      ),
    );
  }
}
