import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dont_read_privacy_policy/product/service/tosdr_service/tosdr_const.dart';

import '../../constants/service_json_const.dart';
import '../../model/points_of_service.dart';

class TosdrService {
  final Dio dio = Dio();

  Future<List<PointsOfServiceModel>> fetchSpecificServices(
    List<int> serviceIdList,
  ) async {
    List<PointsOfServiceModel> servicesList = [];

    for (int id in serviceIdList) {
      final response = await dio.get(
        '${ServiceConst.searchUrl}$id',
      );

      if (response.statusCode == HttpStatus.ok) {
        if (response.data != null &&
            response.data[ServiceJsonConst.parameters.name]
                        [ServiceJsonConst.rating.name]
                    .toString() !=
                '32') {
          servicesList.add(
            PointsOfServiceModel.fromJson(
              response.data[ServiceJsonConst.parameters.name],
            ),
          );
        }
      }
    }
    return servicesList;
  }

  Future<List<PointsOfServiceModel>> fetchSearchedServices(String query) async {
    List<PointsOfServiceModel> servicesList = [];
    List<int> servicesIdList = [];

    final response = await dio.get('${ServiceConst.searchQuery}$query');

    if (response.statusCode == HttpStatus.ok) {
      // ignore: unnecessary_null_comparison
      if (response != null) {
        final json = response.data as Map<String, dynamic>;

        final jsonList = json[ServiceJsonConst.parameters.name]
            [ServiceJsonConst.services.name] as List;

        servicesIdList = jsonList
            .map(
              (e) => int.parse(
                e[ServiceJsonConst.id.name].toString(),
              ),
            )
            .toList();

        servicesList = await fetchSpecificServices(servicesIdList);
      }
    }
    return servicesList;
  }
}
