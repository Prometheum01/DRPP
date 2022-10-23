import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class IntroPageWithLogo extends StatelessWidget {
  const IntroPageWithLogo({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
  }) : super(key: key);

  final String text;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.dynamicHeight(1),
      color: backgroundColor,
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: context.textTheme.headline6?.copyWith(color: textColor),
        ),
      ),
    );
  }
}
