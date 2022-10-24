import 'package:dont_read_privacy_policy/product/model/points_of_service.dart';
import 'package:flutter/material.dart';

class ServiceProvider extends ChangeNotifier {
  List<PointsOfServiceModel> _popularServices = [];

  setPopularServices(List<PointsOfServiceModel> newServices) {
    _popularServices = newServices;
    notifyListeners();
  }

  List<PointsOfServiceModel> get getPopularServices => _popularServices;
}
