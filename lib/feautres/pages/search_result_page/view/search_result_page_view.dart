import 'package:dont_read_privacy_policy/feautres/pages/loading_page/view/loading_page_view.dart';
import 'package:dont_read_privacy_policy/feautres/pages/search_result_page/view_model/search_result_page_view_model.dart';
import 'package:dont_read_privacy_policy/product/constants/string_const.dart';
import 'package:dont_read_privacy_policy/product/widgets/service_main_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SearchResultPageView extends StatefulWidget {
  const SearchResultPageView({super.key, required this.searchKeys});

  final String searchKeys;

  @override
  State<SearchResultPageView> createState() => _SearchResultPageViewState();
}

class _SearchResultPageViewState extends SearchResultPageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _searchAppBar(),
      body: isLoading
          ? const LoadingPageView()
          : listOfServiceModels.isEmpty
              ? Center(
                  child: Lottie.asset(StringConsts.notFoundPagePath),
                )
              : ListView.builder(
                  itemCount: listOfServiceModels.length,
                  itemBuilder: (context, index) {
                    return ServiceMainDetailWidget(
                      pointsOfServiceModel: listOfServiceModels[index],
                    );
                  },
                ),
    );
  }

  AppBar _searchAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      title: Form(
        key: formKey,
        child: TextFormField(
          controller: searchTextController,
          enableIMEPersonalizedLearning: true,
          enableSuggestions: true,
          validator: (value) {
            if (!(value != null && value.trim().isNotEmpty)) {
              return '';
            }
            return null;
          },
          decoration: const InputDecoration(
            hintText: 'Search service name...',
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
          splashRadius: 24,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              fetchSearchKeys(searchTextController.text.trim().toString());
              searchTextController.text = '';
            } else {
              //Toast
            }
          },
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
