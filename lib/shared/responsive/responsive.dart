import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width.toInt() < 800;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width.toInt() >= 800 &&
      MediaQuery.of(context).size.width.toInt() < 1200;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width.toInt() >= 1200;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth.toInt() >= 1200) {
          return desktop;
        } else if (constraints.maxWidth.toInt() >= 800) {
          return tablet ?? mobile;
        } else {
          return mobile;
        }
      },
    );
  }
}
