import 'package:flutter/cupertino.dart';

class SizeItems {
  String T_shirt_size;
  SizeItems(this.T_shirt_size);
  static List<SizeItems> generatedMySourecList() {
    return [
      SizeItems("S"),
      SizeItems("M"),
      SizeItems("XL"),
      SizeItems("XLL"),
    ];
  }
}
