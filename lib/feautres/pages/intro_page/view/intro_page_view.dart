import 'package:dont_read_privacy_policy/feautres/pages/intro_page/view_model/intro_page_view_model.dart';
import 'package:dont_read_privacy_policy/product/constants/string_const.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../product/widgets/intro_page_with_logo.dart';

class IntroPageView extends StatefulWidget {
  const IntroPageView({super.key});

  @override
  State<IntroPageView> createState() => _IntroPageViewState();
}

class _IntroPageViewState extends IntroPageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
            fullTransitionValue: context.durationLow.inMilliseconds.toDouble(),
            liquidController: liquidController,
            enableSideReveal: true,
            enableLoop: false,
            slideIconWidget: const Icon(
              Icons.arrow_back_ios_new_rounded,
            ),
            onPageChangeCallback: (activePageIndex) {
              setState(() {
                currentIndex = activePageIndex;
              });
            },
            waveType: WaveType.liquidReveal,
            pages: const [
              IntroPageWithLogo(
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  text: StringConsts.introFirstText),
              IntroPageWithLogo(
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  text: StringConsts.introSecondText),
              IntroPageWithLogo(
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  text: StringConsts.introThirdText),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            child: Image.asset(
              StringConsts.logoPath,
              height: context.dynamicHeight(0.5),
              width: context.dynamicHeight(0.5),
            ),
          ),
          Positioned(
            bottom: context.dynamicHeight(0.025),
            left: context.dynamicWidth(0.05),
            right: context.dynamicWidth(0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    beforePage();
                  },
                  child: currentIndex == 0
                      ? const SizedBox.shrink()
                      : Text(
                          'Before',
                          style: context.textTheme.headline6?.copyWith(
                              color: currentIndex.isOdd
                                  ? Colors.black
                                  : Colors.white),
                        ),
                ),
                AnimatedSmoothIndicator(
                  activeIndex: currentIndex,
                  duration: context.durationLow,
                  effect: WormEffect(
                    activeDotColor:
                        currentIndex.isOdd ? Colors.white : Colors.black,
                    dotColor: currentIndex.isOdd ? Colors.black : Colors.white,
                  ),
                  count: 3,
                  onDotClicked: (index) {
                    clickDot(index);
                  },
                ),
                TextButton(
                  onPressed: () {
                    nextPage();
                  },
                  child: currentIndex == 2
                      ? Text(
                          'Finish',
                          style: context.textTheme.headline6?.copyWith(
                              color: currentIndex.isOdd
                                  ? Colors.black
                                  : Colors.white),
                        )
                      : Text(
                          'Next',
                          style: context.textTheme.headline6?.copyWith(
                              color: currentIndex.isOdd
                                  ? Colors.black
                                  : Colors.white),
                        ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
