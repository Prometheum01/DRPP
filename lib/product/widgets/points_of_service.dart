import 'package:flutter/material.dart';

import '../../core/constants/padding_const.dart';
import '../../core/constants/radius_const.dart';
import '../model/points_of_service.dart';
import '../service/url_launcher/custom_url_launcher.dart';

class PointOfServiceWidget extends StatelessWidget {
  const PointOfServiceWidget({
    Key? key,
    required this.pointsOfServiceModel,
    required this.index,
  }) : super(key: key);

  final PointsOfServiceModel pointsOfServiceModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.25),
        borderRadius: const RadiusConst.mediumAll(),
      ),
      child: Padding(
        padding: const PaddingConst.mediumAll(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                children: [
                  Padding(
                    padding: const PaddingConst.onlyRightMedium(),
                    child: Text((index + 1).toString()),
                  ),
                  Flexible(
                    child: Text(
                      pointsOfServiceModel.pointsOfService[index].title,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                CustomUrlLauncher.customLaunchUrl(
                    pointsOfServiceModel.pointsOfService[index].source);
              },
              splashColor: pointsOfServiceModel.serviceColor,
              splashRadius: 24,
              icon: const Icon(
                Icons.source_outlined,
              ),
            )
          ],
        ),
      ),
    );
  }
}
