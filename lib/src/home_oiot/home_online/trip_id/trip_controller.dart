import 'package:flutter/material.dart';
import 'dart:async';

class TripProvider with ChangeNotifier {
  late Timer _timer;
  int _totalKm = 10;
  int _totalMinutes = 20;
  double _progressValue = 1.0;

  int get totalKm => _totalKm;
  int get totalMinutes => _totalMinutes;
  double get progressValue => _progressValue;

  TripProvider() {
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_totalKm == 0 && _totalMinutes == 0) {
        _timer.cancel();
      } else {
        if (_totalKm > 0) _totalKm--;
        if (_totalMinutes > 0) _totalMinutes--;

        _progressValue = (_totalKm / 10.0) + (_totalMinutes / 20.0) / 10.0;
        notifyListeners();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
