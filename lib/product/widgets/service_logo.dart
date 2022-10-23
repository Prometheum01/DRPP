import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../constants/string_const.dart';

class ServiceLogo extends StatelessWidget {
  const ServiceLogo({
    Key? key,
    required this.url,
    required this.heroUrl,
  }) : super(key: key);

  final String url;
  final String heroUrl;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroUrl,
      child: Image.network(
        url,
        height: context.dynamicHeight(0.1),
        width: context.dynamicHeight(0.1),
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(StringConsts.noLogoPath);
        },
      ),
    );
  }
}
