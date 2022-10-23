import 'package:dont_read_privacy_policy/feautres/pages/service_detail_page/view/service_detail_page_view.dart';
import 'package:dont_read_privacy_policy/product/widgets/service_logo.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../core/constants/padding_const.dart';
import '../../core/constants/radius_const.dart';
import '../model/points_of_service.dart';
import 'main_service_name_with_reviewed.dart';

class ServiceMainDetailWidget extends StatelessWidget {
  const ServiceMainDetailWidget({
    Key? key,
    required this.pointsOfServiceModel,
  }) : super(key: key);

  final PointsOfServiceModel pointsOfServiceModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const PaddingConst.lowAll(),
          child: InkWell(
            borderRadius: const RadiusConst.mediumAll(),
            splashColor: pointsOfServiceModel.serviceColor.withOpacity(0.75),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ServiceDetailPageView(
                    pointsOfServiceModel: pointsOfServiceModel,
                  ),
                ),
              );
            },
            child: Container(
              height: context.dynamicHeight(0.15),
              width: double.infinity,
              decoration: BoxDecoration(
                color: pointsOfServiceModel.serviceColor.withOpacity(0.25),
                borderRadius: const RadiusConst.mediumAll(),
              ),
              child: Padding(
                padding: const PaddingConst.lowAll(),
                child: Row(
                  children: [
                    ServiceLogo(
                      url: pointsOfServiceModel.image,
                      heroUrl: 'ServiceLogo${pointsOfServiceModel.serviceId}',
                    ),
                    Padding(
                      padding: const PaddingConst.horizontalMedium(),
                      child: MainServiceNameWithReviewed(
                          pointsOfServiceModel: pointsOfServiceModel),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: (context.dynamicHeight(0.15 / 2) + 16) / 2,
          child: Container(
            height: context.dynamicHeight(0.075),
            width: context.dynamicWidth(0.25),
            decoration: BoxDecoration(
              color: pointsOfServiceModel.serviceColor,
              borderRadius: const RadiusConst.mediumHorizontalLeft(),
            ),
            child: Center(
                child: Text(
              pointsOfServiceModel.ratingWithText,
              style: context.textTheme.headline6?.copyWith(color: Colors.white),
            )),
          ),
        ),
      ],
    );
  }
}
