import 'package:flutter/material.dart';
import 'package:portfolio/utils/utils.dart';

class OffsetsProvider extends ChangeNotifier {
  final List<double> _offssets = [
    for (int i = 0; i < myInfo.apps.length; i++) 0,
  ];

  bool _mouseRegion = false;

  get mouseRegion => _mouseRegion;

  double _offsetHeader = 0.0;

  get offsetHeader => _offsetHeader;

  get offsets => _offssets;

  setOffsets(double newO, double height) {
    _offsetHeader = newO;
    double foo = 2.5;
    for (var i = 0; i < myInfo.apps.length; i++) {
      offsets[i] = newO - height * foo;
      foo += 2.5;
    }
    if (newO > height / 3 && newO < height) {
      _mouseRegion = true;
    } else {
      _mouseRegion = false;
    }
    notifyListeners();
  }
}
