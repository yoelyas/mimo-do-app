import 'package:flutter/material.dart';
import 'package:pictionaty_app/const/theme.dart';
import 'package:pictionaty_app/providers/viewport_provider.dart';
import 'package:pictionaty_app/widgets/main_app_bar.dart';
import 'package:provider/provider.dart';

class PeliculaPage extends StatelessWidget {
  const PeliculaPage({Key? key}) : super(key: key);

  static const String routeName = 'pelicula';

  @override
  Widget build(BuildContext context) {
    final viewport = Provider.of<ViewportProvider>(context);
    final mainAppBar = MimoAppbar();
    return Scaffold(
      appBar: mainAppBar.getWidget(context),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: mimodoTheme.background,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: viewport.getHeight() * 0.08),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 1, color: mimodoTheme.primary),
                ),
                width: viewport.getWidth() * 0.5,
                height: viewport.getHeight() * 0.5,
                child: GestureDetector(
                  /*child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image(
                      image: AssetImage('assets/signo.png'), fit: BoxFit.cover),
                )*/
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: const FadeInImage(
                        placeholder: AssetImage('assets/signo.png'),
                        image: NetworkImage(
                            'https://ramenparados.com/wp-content/uploads/2021/05/portada_your-name-another-side__202102241311-300x400.png'),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: viewport.getHeight() * 0.08,
            ),
            Container(
              width: viewport.getWidth() * 0.12,
              height: viewport.getHeight() * 0.08,
              decoration: BoxDecoration(
                color: mimodoTheme.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: OutlinedButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.replay_outlined,
                    color: mimodoTheme.background,
                    size: 20,
                  )),
            ),
            SizedBox(
              height: viewport.getHeight() * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: mimodoTheme.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  child: Text(
                    "Listo",
                    style: TextStyle(
                      color: mimodoTheme.background,
                      fontSize: 30,
                      fontFamily: mimodoTheme.fonts.title,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
