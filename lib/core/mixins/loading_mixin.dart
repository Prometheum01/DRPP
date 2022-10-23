import 'package:flutter/material.dart';

mixin LoadingMixin<T extends StatefulWidget> on State<T> {
  bool _isLoading = false;

  changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  setLoading(bool newLoading) {
    setState(() {
      _isLoading = newLoading;
    });
  }

  bool get isLoading => _isLoading;
}
