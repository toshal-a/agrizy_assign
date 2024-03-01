// Place fonts/icomoon.ttf in your fonts/ directory and
// add the following to your pubspec.yaml
// flutter:
//   fonts:
//    - family: icomoon
//      fonts:
//       - asset: fonts/icomoon.ttf
import 'package:flutter/widgets.dart';

class Icomoon {
  Icomoon._();

  static const String _fontFamily = 'icomoon';

  static const IconData filled_copy = IconData(0xe907, fontFamily: _fontFamily);
  static const IconData back_arrow = IconData(0xe900, fontFamily: _fontFamily);
  static const IconData bulb = IconData(0xe901, fontFamily: _fontFamily);
  static const IconData google_grey = IconData(0xe902, fontFamily: _fontFamily);
  static const IconData info = IconData(0xe903, fontFamily: _fontFamily);
  static const IconData right_arrow = IconData(0xe904, fontFamily: _fontFamily);
  static const IconData download_down = IconData(0xe905, fontFamily: _fontFamily);
  static const IconData keyboard_content = IconData(0xe906, fontFamily: _fontFamily);
}
