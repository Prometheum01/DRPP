import 'package:dont_read_privacy_policy/product/constants/string_const.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';

import '../view_model/book_page_view_model.dart';

class BookPageView extends StatefulWidget {
  const BookPageView({super.key});

  @override
  State<BookPageView> createState() => _BookPageViewState();
}

class _BookPageViewState extends BookPageViewModel {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        StringConsts.comingSoonLottiePath,
        height: context.dynamicHeight(0.5),
      ),
    );
  }
}
