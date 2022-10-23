import 'package:dont_read_privacy_policy/feautres/pages/services_page/view/services_page_view.dart';
import 'package:flutter/material.dart';

abstract class ServicesPageViewModel extends State<ServicesPageView> {
  late final TextEditingController searchTextController;

  late final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    searchTextController = TextEditingController();
  }
}
