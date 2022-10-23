import 'package:dont_read_privacy_policy/core/mixins/loading_mixin.dart';
import 'package:dont_read_privacy_policy/feautres/pages/service_detail_page/view/service_detail_page_view.dart';
import 'package:dont_read_privacy_policy/product/service/tosdr_service/tosdr_service.dart';
import 'package:flutter/material.dart';

abstract class ServiceDetailPageViewModel extends State<ServiceDetailPageView>
    with LoadingMixin {
  late final TosdrService tosdrService;

  @override
  void initState() {
    super.initState();

    tosdrService = TosdrService();
  }
}
