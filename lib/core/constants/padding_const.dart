import 'package:flutter/material.dart';

class PaddingConst extends EdgeInsets {
  const PaddingConst.lowAll() : super.all(8);
  const PaddingConst.horizontalMedium() : super.symmetric(horizontal: 16);
  const PaddingConst.mediumAll() : super.all(16);
  const PaddingConst.onlyRightMedium() : super.only(right: 16);
}
