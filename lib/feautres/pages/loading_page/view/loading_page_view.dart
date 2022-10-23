import 'package:dont_read_privacy_policy/product/constants/string_const.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../view_model/loading_page_view_model.dart';

class LoadingPageView extends StatefulWidget {
  const LoadingPageView({super.key});

  @override
  State<LoadingPageView> createState() => _LoadingPageViewState();
}

class _LoadingPageViewState extends LoadingPageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              StringConsts.loadingLottiePath,
            ),
            const Text('We are trying to find...')
          ],
        ),
      ),
    );
  }
}
