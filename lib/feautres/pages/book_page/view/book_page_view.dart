import 'package:flutter/material.dart';

import '../view_model/book_page_view_model.dart';

class BookPageView extends StatefulWidget {
  const BookPageView({super.key});

  @override
  State<BookPageView> createState() => _BookPageViewState();
}

class _BookPageViewState extends BookPageViewModel {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
    );
  }
}
