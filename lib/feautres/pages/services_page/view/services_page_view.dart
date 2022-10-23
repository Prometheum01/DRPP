import 'package:dont_read_privacy_policy/core/provider/service_provider.dart';
import 'package:dont_read_privacy_policy/feautres/pages/search_result_page/view/search_result_page_view.dart';
import 'package:dont_read_privacy_policy/product/constants/string_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../../../product/widgets/service_main_detail_widget.dart';
import '../../../../product/widgets/staggered_list_item.dart';
import '../view_model/services_page_view_model.dart';

class ServicesPageView extends StatefulWidget {
  const ServicesPageView({super.key});

  @override
  State<ServicesPageView> createState() => _ServicesPageViewState();
}

class _ServicesPageViewState extends ServicesPageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _searchAppBar(),
      body: Column(
        children: [
          Text(
            'Popular Services',
            style: context.textTheme.headline4,
          ),
          Expanded(
            child: AnimationLimiter(
              child: ListView.builder(
                itemCount:
                    context.watch<ServiceProvider>().getPopularServices.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return StaggeredItem(
                    index: index,
                    child: ServiceMainDetailWidget(
                        pointsOfServiceModel: context
                            .watch<ServiceProvider>()
                            .getPopularServices[index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _searchAppBar() {
    return AppBar(
      leading: Image.asset(
        StringConsts.logoPath,
        fit: BoxFit.cover,
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
              final String tempKey =
                  searchTextController.text.trim().toString();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SearchResultPageView(searchKeys: tempKey),
              ));
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
