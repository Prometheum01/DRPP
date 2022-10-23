import 'package:flutter/widgets.dart';

class RadiusConst extends BorderRadius {
  const RadiusConst.mediumAll()
      : super.all(
          const Radius.circular(16),
        );
  const RadiusConst.mediumHorizontalLeft()
      : super.horizontal(
          left: const Radius.circular(16),
        );
}
