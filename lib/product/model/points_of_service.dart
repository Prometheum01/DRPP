import 'package:dont_read_privacy_policy/product/constants/service_json_const.dart';
import 'package:flutter/material.dart';

import '../constants/color_consts.dart';

/* 
  2**0 = A
  2**1 = B
  2**2 = C
  2**3 = D
  2**4 = E
  2**5 = N/A

*/

class PointsOfServiceModel {
  final int serviceId;
  final String name;
  final String wikipedia;
  final String image;
  final int rating;
  final bool isComprehensivelyReviewed;
  final List<PointOfService> pointsOfService;

  PointsOfServiceModel({
    required this.serviceId,
    required this.name,
    required this.wikipedia,
    required this.image,
    required this.rating,
    required this.isComprehensivelyReviewed,
    required this.pointsOfService,
  });

  String get ratingLetter {
    switch (rating) {
      case 1:
        return ServiceStringConst.gradeA;
      case 2:
        return ServiceStringConst.gradeB;
      case 4:
        return ServiceStringConst.gradeC;
      case 8:
        return ServiceStringConst.gradeD;
      case 16:
        return ServiceStringConst.gradeE;
      case 32:
        return ServiceStringConst.gradeNA;

      default:
        return ServiceStringConst.gradeNA;
    }
  }

  String get ratingWithText {
    if (ratingLetter != ServiceStringConst.gradeNA) {
      return '${ServiceStringConst.grade} $ratingLetter';
    }
    return ServiceStringConst.gradeNO;
  }

  Color get serviceColor {
    switch (rating) {
      case 1:
        return ColorConst.gradeAColor;
      case 2:
        return ColorConst.gradeBColor;
      case 4:
        return ColorConst.gradeCColor;
      case 8:
        return ColorConst.gradeDColor;
      case 16:
        return ColorConst.gradeEColor;
      case 32:
        return ColorConst.gradeNoColor;

      default:
        return ColorConst.gradeNoColor;
    }
  }

  static PointsOfServiceModel fromJson(Map<String, dynamic> json) {
    List pointsJson = json[ServiceJsonConst.points.name];

    List<PointOfService> pointList = [];

    for (final i in pointsJson) {
      PointOfService pointOfService = PointOfService.fromJson(i);
      if (pointOfService.status == ServiceJsonConst.approved.name) {
        pointList.add(pointOfService);
      }
    }

    return PointsOfServiceModel(
        serviceId: int.parse(json[ServiceJsonConst.id.name].toString()),
        name: json[ServiceJsonConst.name.name].toString(),
        wikipedia: json[ServiceJsonConst.wikipedia.name].toString(),
        image: json[ServiceJsonConst.image.name].toString(),
        rating: int.parse(json[ServiceJsonConst.rating.name].toString()),
        isComprehensivelyReviewed:
            json[ServiceJsonConst.is_comprehensively_reviewed.name],
        pointsOfService: pointList);
  }
}

class PointOfService {
  final int pointsId;
  final String title;
  final String source;
  final String status;
  final String quoteText;

  PointOfService({
    required this.pointsId,
    required this.title,
    required this.source,
    required this.status,
    required this.quoteText,
  });

  factory PointOfService.fromJson(Map<String, dynamic> json) {
    return PointOfService(
        pointsId: int.parse(json[ServiceJsonConst.id.name].toString()),
        title: json[ServiceJsonConst.title.name].toString(),
        source: json[ServiceJsonConst.source.name].toString(),
        status: json[ServiceJsonConst.status.name].toString(),
        quoteText: json[ServiceJsonConst.quoteText.name].toString());
  }
}
