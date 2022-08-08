import 'package:flutter/material.dart';
import 'package:portfolio/presentation/providers/responsive_breakpoints_provider.dart';
import 'package:portfolio/utils/enums.dart';
import 'package:provider/provider.dart';

class Responsive extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;

  Responsive({
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

// This size work fine on my design, maybe you need some customization depends on your design

  // This isMobile, isTablet, isDesktop helep us later
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 650;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      // If our width is more than 1100 then we consider it a desktop
      builder: (context, constraints) {
        print("Constraints ${constraints.maxHeight}");
        if (constraints.maxWidth >= 1100) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            context
                .read<ResponsiveBreakPointsProvider>()
                .setBreakpoint(BreakPoint.desktop);
          });
          return desktop!;
        }
        // If width it less then 1100 and more then 650 we consider it as tablet
        else if (constraints.maxWidth >= 650) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            context
                .read<ResponsiveBreakPointsProvider>()
                .setBreakpoint(BreakPoint.tablet);
          });
          return tablet!;
        }
        // Or less then that we called it mobile
        else {
          print("Is mobileee");
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            context
                .read<ResponsiveBreakPointsProvider>()
                .setBreakpoint(BreakPoint.mobile);
          });
          return mobile!;
        }
      },
    );
  }
}