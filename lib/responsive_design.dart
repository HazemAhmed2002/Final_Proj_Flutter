import 'package:flutter/material.dart';
import 'package:todaydo_app/screens/responsive_design/larg_screens.dart';
import 'package:todaydo_app/screens/responsive_design/small_screens.dart';

class ResponsiveDesign extends StatelessWidget {
  static const String screenRoute = 'Responsive_design';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MediaQuery.of(context).size.width > 500
            ? LargeScreen()
            : SmallScreen());
  }
}
