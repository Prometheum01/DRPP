import 'package:dont_read_privacy_policy/core/constants/padding_const.dart';
import 'package:dont_read_privacy_policy/core/constants/radius_const.dart';
import 'package:dont_read_privacy_policy/feautres/pages/service_detail_page/view_model/service_detail_page_view_model.dart';
import 'package:dont_read_privacy_policy/product/constants/string_const.dart';
import 'package:dont_read_privacy_policy/product/model/points_of_service.dart';
import 'package:dont_read_privacy_policy/product/service/url_launcher/custom_url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class ServiceDetailPageView extends StatefulWidget {
  const ServiceDetailPageView({super.key, required this.pointsOfServiceModel});

  final PointsOfServiceModel pointsOfServiceModel;

  @override
  State<ServiceDetailPageView> createState() => _ServiceDetailPageViewState();
}

class _ServiceDetailPageViewState extends ServiceDetailPageViewModel {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.white,
          widget.pointsOfServiceModel.serviceColor,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                elevation: 0,
                actions: [
                  //Wikipedia
                  GestureDetector(
                    onTap: () {
                      CustomUrlLauncher.customLaunchUrl(
                          widget.pointsOfServiceModel.wikipedia);
                    },
                    child: Image.asset(StringConsts.wikipediaLogoPath),
                  )
                ],
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                backgroundColor: Colors.transparent,
                expandedHeight: context.dynamicHeight(0.25),
                flexibleSpace: FlexibleSpaceBar(
                  background: Hero(
                    tag: 'ServiceLogo${widget.pointsOfServiceModel.serviceId}',
                    child: Image.network(
                      widget.pointsOfServiceModel.image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: context.dynamicHeight(0.05),
                  child: Center(
                    child: Text(
                      'Total points of ${widget.pointsOfServiceModel.name}: ${widget.pointsOfServiceModel.pointsOfService.length}',
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Padding(
                      padding: const PaddingConst.lowAll(),
                      child: PointOfService(
                          index: index,
                          pointsOfServiceModel: widget.pointsOfServiceModel),
                    );
                  },
                  childCount:
                      widget.pointsOfServiceModel.pointsOfService.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PointOfService extends StatelessWidget {
  const PointOfService({
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
