import 'package:dont_read_privacy_policy/core/provider/service_provider.dart';
import 'package:dont_read_privacy_policy/product/constants/string_const.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../view_model/book_page_view_model.dart';

class BookPageView extends StatefulWidget {
  const BookPageView({super.key});

  @override
  State<BookPageView> createState() => _BookPageViewState();
}

class _BookPageViewState extends BookPageViewModel {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.watch<ServiceProvider>().caseList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: context.watch<ServiceProvider>().caseList.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(context
                    .watch<ServiceProvider>()
                    .caseList[index]
                    .ratingHuman),
              ),
            ),
    );
  }
}


/*Center(
      child: Lottie.asset(
        StringConsts.comingSoonLottiePath,
        height: context.dynamicHeight(0.5),
      ),
    ) */