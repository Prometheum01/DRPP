import 'package:dont_read_privacy_policy/feautres/pages/book_page/view/book_page_view.dart';
import 'package:dont_read_privacy_policy/feautres/pages/loading_page/view/loading_page_view.dart';
import 'package:dont_read_privacy_policy/feautres/pages/services_page/view/services_page_view.dart';
import 'package:flutter/material.dart';

import '../view_model/home_page_view_model.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends HomePageViewModel {
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const LoadingPageView()
        : Scaffold(
            bottomNavigationBar: _bottomNavigationBar(),
            body: PageView(
              controller: controller,
              onPageChanged: (value) {
                changePage(value);
              },
              children: const [
                ServicesPageView(),
                BookPageView(),
              ],
            ),
          );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: currentPageIndex,
      onTap: (value) {
        changePage(value);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
          ),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.book,
          ),
          label: 'Courses',
        ),
      ],
    );
  }
}
