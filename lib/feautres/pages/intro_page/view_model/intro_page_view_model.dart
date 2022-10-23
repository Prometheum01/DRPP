import 'package:dont_read_privacy_policy/feautres/pages/home_page/view/home_page_view.dart';
import 'package:dont_read_privacy_policy/product/service/cache_service/shared_service.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view/intro_page_view.dart';

abstract class IntroPageViewModel extends State<IntroPageView> {
  late final LiquidController liquidController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    checkIntro();

    liquidController = LiquidController();
  }

  checkIntro() async {
    SharedManager sharedManager =
        SharedManager(sharedPreferences: await SharedPreferences.getInstance());

    if (sharedManager.getBoolData('isSkipIntroBefore')) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const HomePageView(),
        ),
      );
    }
  }

  clickDot(int index) {
    setState(() {
      currentIndex = index;
      liquidController.animateToPage(page: currentIndex);
    });
  }

  beforePage() {
    if (currentIndex != 0) {
      setState(
        () {
          currentIndex = currentIndex - 1;
          liquidController.animateToPage(page: currentIndex);
        },
      );
    }
  }

  skipPage() async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const HomePageView(),
      ),
    );
    SharedManager sharedManager =
        SharedManager(sharedPreferences: await SharedPreferences.getInstance());

    sharedManager.setBoolData('isSkipIntroBefore', true);
  }

  nextPage() async {
    if (currentIndex != 2) {
      setState(
        () {
          currentIndex = currentIndex + 1;
          liquidController.animateToPage(page: currentIndex);
        },
      );
    } else {
      await skipPage();
    }
  }
}
