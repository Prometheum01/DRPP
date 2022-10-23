import 'package:dont_read_privacy_policy/core/mixins/loading_mixin.dart';
import 'package:dont_read_privacy_policy/product/model/points_of_service.dart';
import 'package:dont_read_privacy_policy/product/service/tosdr_service/tosdr_service.dart';
import 'package:flutter/material.dart';

import '../view/search_result_page_view.dart';

abstract class SearchResultPageViewModel extends State<SearchResultPageView>
    with LoadingMixin {
  late final TosdrService tosdrService;

  final formKey = GlobalKey<FormState>();

  late final TextEditingController searchTextController =
      TextEditingController();

  List<PointsOfServiceModel> listOfServiceModels = [];

  @override
  void initState() {
    super.initState();

    tosdrService = TosdrService();

    Future.microtask(() => fetchSearchKeys(widget.searchKeys));
  }

  fetchSearchKeys(String keys) async {
    changeLoading();
    listOfServiceModels = await tosdrService.fetchSearchedServices(keys);

    changeLoading();
  }
}
