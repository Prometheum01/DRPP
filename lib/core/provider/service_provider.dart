import 'package:dont_read_privacy_policy/product/model/points_of_service.dart';
import 'package:flutter/material.dart';

class ServiceProvider extends ChangeNotifier {
  List<PointsOfServiceModel> _popularServices = [];
  List<CaseModel> _casesList = [];

  setPopularServices(List<PointsOfServiceModel> newServices) {
    _popularServices = newServices;
    notifyListeners();
  }

  setCaseList(List<CaseModel> newCaseList) {
    _casesList = newCaseList;
    notifyListeners();
  }

  List<CaseModel> get caseList => _casesList;

  List<PointsOfServiceModel> get getPopularServices => _popularServices;
}
