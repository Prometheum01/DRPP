import 'package:dont_read_privacy_policy/core/mixins/loading_mixin.dart';
import 'package:dont_read_privacy_policy/core/provider/service_provider.dart';
import 'package:dont_read_privacy_policy/product/constants/service_json_const.dart';
import 'package:dont_read_privacy_policy/product/service/tosdr_service/tosdr_service.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../view/home_page_view.dart';

abstract class HomePageViewModel extends State<HomePageView> with LoadingMixin {
  late PageController controller;
  late final TosdrService tosdrService;
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();

    changeLoading();
    tosdrService = TosdrService();
    controller = PageController();
    Future.microtask(() => fetchPopularServices());
  }

  changePage(int newPageIndex) {
    setState(() {
      currentPageIndex = newPageIndex;
      controller.animateToPage(currentPageIndex,
          duration: context.durationLow, curve: Curves.ease);
    });
  }

  fetchPopularServices() async {
    context.read<ServiceProvider>().setPopularServices(await tosdrService
        .fetchSpecificServices(PopularServiceList.popularServiceList));
    changeLoading();
  }
}
