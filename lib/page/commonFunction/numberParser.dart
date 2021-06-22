

import 'package:intl/intl.dart';

class NumberParser {

  String parseNumber(dynamic src) {
    return NumberFormat.decimalPattern().format(src);
  }

  String shrinkNumber(int src) {
    String result = NumberFormat.decimalPattern().format(src);
    ///천k
    if(src>1000){
      result = NumberFormat.decimalPattern().format(src/1000)+"천";
      ///만m
      if(src>10000){
        result = NumberFormat.decimalPattern().format(src/10000)+"만";
        ///억b
        if(src>100000000){
          result = NumberFormat.decimalPattern().format(src/100000000)+"억";
          ///조t
          if(src>1000000000000){
            result = NumberFormat.decimalPattern().format(src/1000000000000)+"조";
          }
        }
      }
    }
    return result;
  }

  /*
  function sigfig(num, sigfigs_opt) {
  // Set default sigfigs to 3
  sigfigs_opt = (typeof sigfigs_opt === "undefined") ? 3 : sigfigs_opt;
  // Only assigns sig figs and suffixes for numbers > 1
  if (num <= 1) return num.toPrecision(sigfigs_opt);
  // Calculate for numbers > 1
  var power10 = log10(num);
  var power10ceiling = Math.floor(power10) + 1;
  // 0 = '', 1 = 'K', 2 = 'M', 3 = 'B', 4 = 'T'
  var SUFFIXES = ['', 'K', 'M', 'B', 'T'];
  // 100: power10 = 2, suffixNum = 0, suffix = ''
  // 1000: power10 = 3, suffixNum = 1, suffix = 'K'
  var suffixNum = Math.floor(power10 / 3);
  var suffix = SUFFIXES[suffixNum];
  // Would be 1 for '', 1000 for 'K', 1000000 for 'M', etc.
  var suffixPower10 = Math.pow(10, suffixNum * 3);
  var base = num / suffixPower10;
  var baseRound = base.toPrecision(sigfigs_opt);
  return baseRound + suffix;
}
   */
}