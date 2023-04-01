import 'package:flutter/widgets.dart';

double getHeight(context, value) {
  return MediaQuery.of(context).size.height * (value / 852);
}

double getWidth(context, value) {
  return MediaQuery.of(context).size.width * (value / 393);
}
