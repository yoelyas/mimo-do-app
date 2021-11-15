import 'package:flutter/material.dart';
import 'package:pictionaty_app/const/theme.dart';

class GeneroButton extends StatelessWidget {
  final String text;
  final IconData icon;
  // ignore: use_key_in_widget_constructors
  const GeneroButton({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
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
                iconSize: 50,
                onPressed: () {},
              ),
            ),
          ),
          Text(
            text,
            style: TextStyle(
              color: mimodoTheme.primary,
              fontSize: 15,
              fontFamily: mimodoTheme.fonts.title,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
