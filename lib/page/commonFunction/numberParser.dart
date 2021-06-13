

import 'package:intl/intl.dart';

class NumberParser {

  String parseNumber(dynamic src) {
    return NumberFormat.decimalPattern().format(src);
  }
}