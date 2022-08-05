import 'package:flutter/material.dart';
import 'package:portfolio/utils/enums.dart';

class ResponsiveBreakPointsProvider extends ChangeNotifier {
  BreakPoint _breakPoint = BreakPoint.desktop;

  get breakpoint => _breakPoint;

  setBreakpoint(BreakPoint newB) {
    _breakPoint = newB;
    notifyListeners();
  }
}
