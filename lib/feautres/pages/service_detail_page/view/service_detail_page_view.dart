import 'package:dont_read_privacy_policy/core/constants/padding_const.dart';
import 'package:dont_read_privacy_policy/feautres/pages/service_detail_page/view_model/service_detail_page_view_model.dart';
import 'package:dont_read_privacy_policy/product/constants/string_const.dart';
import 'package:dont_read_privacy_policy/product/model/points_of_service.dart';
import 'package:dont_read_privacy_policy/product/service/url_launcher/custom_url_launcher.dart';
import 'package:dont_read_privacy_policy/product/widgets/points_of_service.dart';
import 'package:dont_read_privacy_policy/product/widgets/staggered_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
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
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(StringConsts.noLogoPath);
                      },
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
              AnimationLimiter(
                child: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return StaggeredItem(
                        index: index,
                        child: Padding(
                          padding: const PaddingConst.lowAll(),
                          child: PointOfServiceWidget(
                              index: index,
                              pointsOfServiceModel:
                                  widget.pointsOfServiceModel),
                        ),
                      );
                    },
                    childCount:
                        widget.pointsOfServiceModel.pointsOfService.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
