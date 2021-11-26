import 'package:flutter/material.dart';
import 'package:pictionaty_app/const/theme.dart';
import 'package:pictionaty_app/providers/viewport_provider.dart';
import 'package:provider/provider.dart';

class GeneroButton extends StatelessWidget {
  final String text;
  final IconData icon;
  // ignore: use_key_in_widget_constructors
  const GeneroButton({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    final viewport = Provider.of<ViewportProvider>(context);
    return SizedBox(
      width: viewport.getCalcWidth(0.2),
      height: viewport.getCalcHeight(0.2),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: viewport.getCalcWidth(0.01),
              bottom: viewport.getCalcWidth(0.02),
              left: viewport.getCalcWidth(0.02),
              right: viewport.getCalcWidth(0.02),
            ),
            child: Container(
              decoration: ShapeDecoration(
                  color: mimodoTheme.primary,
                  shape: const CircleBorder(),
                  shadows: [
                    BoxShadow(
                        color: mimodoTheme.secondary,
                        offset: const Offset(0, 2),
                        blurRadius: 2,
                        spreadRadius: 3)
                  ]),
              child: IconButton(
                icon: Icon(icon),
                color: mimodoTheme.background,
                iconSize: viewport.getCalcHeight(0.08),
                onPressed: () {},
              ),
            ),
          ),
          Text(
            text,
            style: TextStyle(
              color: mimodoTheme.primary,
              fontSize: viewport.getCalcHeight(0.025),
              fontFamily: mimodoTheme.fonts.title,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
