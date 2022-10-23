import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';

import '../constants/string_const.dart';

class NotFoundLottie extends StatelessWidget {
  const NotFoundLottie({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        StringConsts.notFoundPagePath,
        height: context.dynamicHeight(0.5),
      ),
    );
  }
}
