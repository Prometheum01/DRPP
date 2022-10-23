import 'package:dont_read_privacy_policy/product/model/points_of_service.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class MainServiceNameWithReviewed extends StatelessWidget {
  const MainServiceNameWithReviewed({
    Key? key,
    required this.pointsOfServiceModel,
  }) : super(key: key);

  final PointsOfServiceModel pointsOfServiceModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: context.dynamicWidth(0.6),
          child: Text(
            pointsOfServiceModel.name,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.headline6?.copyWith(fontSize: 24),
          ),
        ),
        Text(
          'Is totally reviewed: ${pointsOfServiceModel.isComprehensivelyReviewed}',
          style: context.textTheme.headline6
              ?.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
