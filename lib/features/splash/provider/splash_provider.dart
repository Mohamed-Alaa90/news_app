import 'package:flutter/material.dart';
import 'dart:async';

class SplashProvider extends ChangeNotifier {
  bool _isLoading = true; // لمعرفة هل البيانات يتم تحميلها أم لا
  bool get isLoading => _isLoading;

  SplashProvider() {
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    await Future.delayed(const Duration(seconds: 2)); // محاكاة تحميل البيانات
    _isLoading = false;
    notifyListeners();
  }
}
