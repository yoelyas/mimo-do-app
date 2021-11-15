import 'package:flutter/cupertino.dart';

class ViewportProvider extends ChangeNotifier {
  BuildContext context;
  double appBarHeight;

  ViewportProvider({
    required this.context,
    required this.appBarHeight,
  });

  setContext(BuildContext context) {
    this.context = context;
    return this;
  }

  getAppBarHeight() {
    return getFullHeight() * appBarHeight;
  }

  getHeight() {
    return getFullHeight() * (1 - appBarHeight);
  }

  getWidth() {
    return getFullWidth();
  }

  getFullHeight() {
    return MediaQuery.of(context).size.height;
  }

  getFullWidth() {
    return MediaQuery.of(context).size.width;
  }

  getCalcHeight(double percent) {
    return getHeight() * percent;
  }

  getCalcWidth(double percent) {
    return getWidth() * percent;
  }
}
