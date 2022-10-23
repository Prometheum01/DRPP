/*import 'package:flutter/material.dart';

import '../constants/color_consts.dart';
import '../constants/service_json_const.dart';

class ServiceDetail {
  final int id;
  final bool? isComprehensivelyReviewed;
  final List urls;
  final String name;
  final String? status;
  final String? wikipedia;
  final String rating;
  final String logo;

  ServiceDetail({
    required this.id,
    required this.isComprehensivelyReviewed,
    required this.urls,
    required this.name,
    required this.status,
    required this.wikipedia,
    required this.rating,
    required this.logo,
  });

  String get ratingWithText {
    if (rating != ServiceStringConst.gradeNA) {
      return '${ServiceStringConst.grade} $rating';
    }
    return ServiceStringConst.gradeNO;
  }

  Color get serviceColor {
    switch (rating) {
      case ServiceStringConst.gradeA:
        return ColorConst.gradeAColor;
      case ServiceStringConst.gradeB:
        return ColorConst.gradeBColor;
      case ServiceStringConst.gradeC:
        return ColorConst.gradeCColor;
      case ServiceStringConst.gradeD:
        return ColorConst.gradeDColor;
      case ServiceStringConst.gradeE:
        return ColorConst.gradeEColor;
      case ServiceStringConst.gradeNA:
        return ColorConst.gradeNoColor;

      default:
        return ColorConst.gradeNoColor;
    }
  }

  static ServiceDetail fromJson(Map<String, dynamic> json) {
    return ServiceDetail(
      id: int.parse(json[ServiceJsonConst.id.name].toString()),
      isComprehensivelyReviewed:
          json[ServiceJsonConst.is_comprehensively_reviewed.name],
      urls: json[ServiceJsonConst.urls.name],
      name: json[ServiceJsonConst.name.name].toString(),
      status: json[ServiceJsonConst.status.name].toString(),
      wikipedia: json[ServiceJsonConst.wikipedia.name].toString(),
      rating: json[ServiceJsonConst.rating.name].toString(),
      logo: json[ServiceJsonConst.logo.name].toString(),
    );
  }
}
*/